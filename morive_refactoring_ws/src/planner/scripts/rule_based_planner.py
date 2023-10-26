#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import rospy
from math import cos, sin, pi, sqrt, pow, atan2
import numpy as np
from tf.transformations import euler_from_quaternion

from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry, Path
from morai_msgs.msg import CtrlCmd, EgoVehicleStatus, ObjectStatusList, EventInfo, Lamps
from morai_msgs.srv import MoraiEventCmdSrv

from controller.scripts.pid_controller import pidControl
from controller.scripts.lateral_controller import pure_pursuit
from controller.scripts.longitudinal_controller import velocityPlanning
from object_detector.scripts.object_detector import object_detector

class rule_based_planner:
    def __init__(self):


        rospy.init_node('rule_based_planner', anonymous=True)

        rospy.Subscriber("/global_path", Path, self.global_path_callback)

        rospy.Subscriber("/Object_topic", ObjectStatusList, self.object_callback)
        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd', CtrlCmd, queue_size=1)

        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        self.is_path = False
        self.is_odom = False
        self.is_status = False
        
        self.is_global_path = False
        self.is_go = False
        self.time = 1
        self.parking_time=1


        self.target_velocity = 40 # morive max_speed": 60, default : 40
        
        self.pid = pidControl()
        self.vel_planning = velocityPlanning(self.target_velocity / 3.6, 0.15)
        self.pure_pursuit = pure_pursuit()
        self.object_detector = object_detector()
        

        while True:
            if self.is_global_path == True:
                self.velocity_list = self.vel_planning.curvedBaseVelocity(self.global_path, 50)
                break
            else:
                pass

        rate = rospy.Rate(30)  # 30hz
        while not rospy.is_shutdown():
            

            if self.is_path == True and self.is_odom == True and self.is_status == True:
                prev_time = time.time()

                self.current_waypoint = self.pure_pursuit.get_current_waypoint(self.status_msg, self.global_path)
                self.target_velocity = self.velocity_list[self.current_waypoint] * 3.6

                steering = self.pure_pursuit.calc_pure_pursuit()
                
                if self.is_look_forward_point:
                    self.ctrl_cmd_msg.steering = steering
                else:
                    self.ctrl_cmd_msg.steering = steering #0.0 last

                output = self.pid.pid(self.target_velocity, self.status_msg.velocity.x * 3.6)

                nearest_dis, heading_difference = self.object_detector.nearest_cost()
                
                if (self.status_msg.position.x > 160.0 and self.status_msg.position.x < 230.0 
                     and self.status_msg.position.y > 1020.0 and self.status_msg.position.y <1780.0 ): 
                    #rospy.loginfo('case 2')
                    
                    # same heading degree
                    if heading_difference > 1.0:
                        if nearest_dis < 25.0:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = 1.0

                            rospy.loginfo('#############brake##############')


                        else:
                            if output > 0.0:
                                self.ctrl_cmd_msg.accel = output
                                self.ctrl_cmd_msg.brake = 0.0
                                # morive brake tunning
                            elif -5.0 < output <= 0.0:
                                self.ctrl_cmd_msg.accel = 0.0
                                self.ctrl_cmd_msg.brake = 0.0

                            else:
                                self.ctrl_cmd_msg.accel = 0.0
                                self.ctrl_cmd_msg.brake = -output
                    else:
                        #rospy.loginfo("output' %s", output)

                        
                        if output > 0.0:
                            self.ctrl_cmd_msg.accel = output
                            self.ctrl_cmd_msg.brake = 0.0

                        # morive brake tunning
                        elif -5.0 < output <= 0.0:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = 0.0

                        else:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = -output

                #circle
                elif (self.status_msg.position.x > -28.0 and self.status_msg.position.x < -17.0
                    and self.status_msg.position.y > 980.0 and self.status_msg.position.y < 1030.0):
                    

                    #rospy.loginfo('case 3')
                    if (self.status_msg.position.x > -25.0 and self.status_msg.position.x < -22.0 
                       and self.status_msg.position.y > 1006.0 and self.status_msg.position.y < 1010.0) and self.is_go == False :
                        for i in range(90) :
                                self.ctrl_cmd_msg.accel = 0.0
                                self.ctrl_cmd_msg.brake = 1.0
                                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                                rate.sleep()
                        self.is_go = True

                    if nearest_dis > 28.0 and nearest_dis < 81.0:
                        if self.status_msg.heading > 95:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = 1.0

                            rospy.loginfo('#############brake##############')
                        
                    else:
                        if output > 0.0:
                            self.ctrl_cmd_msg.accel = output/40.0
                            self.ctrl_cmd_msg.brake = 0.0

                        else:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = -output
                #before circle
                elif (self.status_msg.position.x > -17.0 and self.status_msg.position.x < 40.0
                    and self.status_msg.position.y > 950.0 and self.status_msg.position.y <1020.0):

                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = output/self.time
                        self.ctrl_cmd_msg.brake = 0.0
                        self.time += 0.3
                        if self.time > 50:
                            self.time = 50
                        

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output

                #before parking
                elif (self.status_msg.position.x > -24.0 and self.status_msg.position.x < 4.0
                    and self.status_msg.position.y > 1024.3 and self.status_msg.position.y <1075.0):

                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = output/50.0
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output    

                #parking
                elif (self.status_msg.position.x > 4.7 and self.status_msg.position.x < 5.7
                    and self.status_msg.position.y > 1023.7 and self.status_msg.position.y < 1024.7):

                    rospy.loginfo('parking.......')

                    # stop
                    start = time.time()
                    while True:
                        response = self.call_service(2)
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = 1.0
                        self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                        if (time.time() - start > 2):
                            break

                    # R
                    rospy.loginfo("drive in reverse....")
                    while True:
                        self.ctrl_cmd_msg.steering = -0.555
                        self.ctrl_cmd_msg.accel = 0.2
                        self.ctrl_cmd_msg.brake = 0.0
                        self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                        if (time.time() - start > 9):
                            break
                    while True:
                        self.ctrl_cmd_msg.steering = 0.0
                        self.ctrl_cmd_msg.accel = 0.2
                        self.ctrl_cmd_msg.brake = 0.0
                        self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                        if (time.time() - start > 11.5):
                            break

                    # p
                    self.ctrl_cmd_msg.steering = 0.0
                    self.ctrl_cmd_msg.accel = 0.0
                    self.ctrl_cmd_msg.brake = 0.0
                    self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                    rate.sleep()
                    response = self.call_service(1)

                    rospy.loginfo("Finished")
                    
                    rospy.signal_shutdown("Finished parking")

                #parking zone
                elif (self.status_msg.position.x > -15.0 and self.status_msg.position.x < 45.0
                    and self.status_msg.position.y > 1010.0 and self.status_msg.position.y <1075.0):
                    
                    if output > 0.0:
                        
                        self.ctrl_cmd_msg.accel = 10.0 / self.parking_time                  
                        self.ctrl_cmd_msg.brake = 0.0
                        self.parking_time += 0.3

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output
                #else
                else:

                    if output > 0.0:
                            self.ctrl_cmd_msg.accel = output
                            self.ctrl_cmd_msg.brake = 0.0

                    # morive brake tunning
                    elif -5.0 < output <= 0.0:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output

                speeds = sqrt(pow(self.status_msg.velocity.x,2)+pow(self.status_msg.velocity.y,2))

                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)

            rate.sleep()


    def call_service(self, gear_value):
        rospy.wait_for_service('Service_MoraiEventCmd')
        try:
            service_client = rospy.ServiceProxy('Service_MoraiEventCmd', MoraiEventCmdSrv)
            request_data = EventInfo()

            request_data.option = 2
            request_data.ctrl_mode = 4 
            request_data.gear = gear_value
            lamps_data = Lamps()
            lamps_data.turnSignal = 0 
            lamps_data.emergencySignal = 0 
            request_data.lamps = lamps_data
            request_data.set_pause = False

            response = service_client(request_data)
            return response
        
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)
            return None


    def object_callback(self, msg):
        self.is_object = True
        self.object_msg = msg


    def global_path_callback(self, msg):
        self.global_path = msg
        self.is_global_path = True



if __name__ == '__main__':
    try:
        test_track = pure_pursuit()

    except rospy.ROSInterruptException:
        pass

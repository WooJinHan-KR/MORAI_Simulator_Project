#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import rospkg
from math import cos,sin,pi,sqrt,pow,atan2
from geometry_msgs.msg import Point,PoseWithCovarianceStamped
from nav_msgs.msg import Odometry,Path
from morai_msgs.msg import CtrlCmd
import numpy as np
import tf
from tf.transformations import euler_from_quaternion,quaternion_from_euler


class pure_pursuit :
    def __init__(self):
        rospy.init_node('pure_pursuit', anonymous=True)
        rospy.Subscriber("local_path", Path, self.path_callback)
        rospy.Subscriber("odom", Odometry, self.odom_callback)
        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd',CtrlCmd, queue_size=1)
        self.ctrl_cmd_msg=CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType=2

        self.is_path=False
        self.is_odom=False

        self.forward_point=Point()
        self.current_postion=Point()
        self.is_look_forward_point=False

        print("you need to change values at line 32~33 ,  self.vegicle_length , lfd")
        self.vehicle_length=0
        self.lfd=0

        rate = rospy.Rate(30) # 30hz
        while not rospy.is_shutdown():
            print("you need to change values at line 32~33 ,  self.vegicle_length , lfd")
            if self.is_path ==True and self.is_odom==True  :
                
                vehicle_position=self.current_postion
                self.is_look_forward_point= False

                translation=[vehicle_position.x, vehicle_position.y]

                t=np.array([
                        [cos(self.vehicle_yaw), -sin(self.vehicle_yaw),translation[0]],
                        [sin(self.vehicle_yaw),cos(self.vehicle_yaw),translation[1]],
                        [0                    ,0                    ,1            ]])

                det_t=np.array([
                       [t[0][0],t[1][0],-(t[0][0]*translation[0]+t[1][0]*translation[1])],
                       [t[0][1],t[1][1],-(t[0][1]*translation[0]+t[1][1]*translation[1])],
                       [0      ,0      ,1                                               ]])

                for num,i in enumerate(self.path.poses) :
                    path_point=i.pose.position

                    global_path_point=[path_point.x,path_point.y,1]
                    local_path_point=det_t.dot(global_path_point)           
                    if local_path_point[0]>0 :
                        dis=sqrt(pow(local_path_point[0],2)+pow(local_path_point[1],2))
                        if dis>= self.lfd :
                            self.forward_point=path_point
                            self.is_look_forward_point=True
                            break
                
                theta=atan2(local_path_point[1],local_path_point[0])
                if self.is_look_forward_point :
                    print("you need to change the value at line 70")
                    self.ctrl_cmd_msg.steering=0
                    self.ctrl_cmd_msg.velocity=20.0
                    print(self.ctrl_cmd_msg.steering)
                else : 
                    print("no found forward point")
                    self.ctrl_cmd_msg.steering=0.0
                    self.ctrl_cmd_msg.velocity=0.0

                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
            rate.sleep()

    def path_callback(self,msg):
        self.is_path=True
        self.path=msg  

    def odom_callback(self,msg):
        self.is_odom=True
        odom_quaternion=(msg.pose.pose.orientation.x,msg.pose.pose.orientation.y,msg.pose.pose.orientation.z,msg.pose.pose.orientation.w)
        _,_,self.vehicle_yaw=euler_from_quaternion(odom_quaternion)
        self.current_postion.x=msg.pose.pose.position.x
        self.current_postion.y=msg.pose.pose.position.y

if __name__ == '__main__':
    try:
        test_track=pure_pursuit()
    except rospy.ROSInterruptException:
        pass

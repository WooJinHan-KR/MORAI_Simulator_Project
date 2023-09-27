#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import rospy
from math import cos,sin,pi,sqrt,pow,atan2
import numpy as np
from tf.transformations import euler_from_quaternion

from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry,Path
from morai_msgs.msg import CtrlCmd,EgoVehicleStatus,ObjectStatusList

class ttc:
    def __init__(self):
        rospy.init_node('ttc', anonymous=True)

        rospy.Subscriber("/Object_topic", ObjectStatusList, self.object_callback)

        rospy.Subscriber("/odom", Odometry, self.odom_callback)
        rospy.Subscriber("/Ego_topic",EgoVehicleStatus, self.status_callback)

        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd',CtrlCmd, queue_size=1)

        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        self.is_odom = False
        self.is_status = False

        self.is_look_forward_point = False

        self.forward_point = Point()
        self.current_postion = Point()

        self.vehicle_length = 0
        self.lfd = 0
        self.min_lfd = 5
        self.max_lfd = 30
        self.lfd_gain = 0.78
        self.target_velocity = 40

    def object_callback(self, msg):
        # ObjectStatusList 메시지 처리
        pass

    def odom_callback(self, msg):
        self.is_odom = True
        odom_quaternion = (msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z, msg.pose.pose.orientation.w)
        _, _, self.vehicle_yaw = euler_from_quaternion(odom_quaternion)
        self.current_postion.x = msg.pose.pose.position.x
        self.current_postion.y = msg.pose.pose.position.y

    def status_callback(self, msg):
        self.is_status = True
        self.status_msg = msg

    def calculate_ttc(self, distance, relative_velocity):
        if relative_velocity <= 0:
            return False

        ttc = distance / relative_velocity
        return ttc

    def main_loop(self):
        rate = rospy.Rate(30)

        while not rospy.is_shutdown():
            if self.is_odom == True and self.is_status == True:
                ego_velocity = self.status_msg.velocity.x * 3.6
                ego_position = self.current_postion

                object_list = self.object_msg.objects

                min_distance = float('inf')
                relative_velocity = 0

                for obstacle in object_list:
                    distance_to_obstacle = sqrt((ego_position.x - obstacle.x)**2 + (ego_position.y - obstacle.y)**2)
                    relative_velocity = obstacle.velocity - ego_velocity
                    min_distance = min(min_distance, distance_to_obstacle)

                ttc_value = self.calculate_ttc(min_distance, relative_velocity)

                threshold = 2.0
                new_velocity = 20
                new_acceleration = 2.0

                if ttc_value < threshold:
                    self.target_velocity = new_velocity
                    self.ctrl_cmd_msg.accel = new_acceleration
                else:
                    pass

                rate.sleep()

if __name__ == '__main__':
    try:
        ttc_node = ttc()
        ttc_node.main_loop()
    except rospy.ROSInterruptException:
        pass
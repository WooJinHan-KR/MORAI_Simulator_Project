#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from math import cos, sin, pi, sqrt, pow, atan2
import numpy as np
from tf.transformations import euler_from_quaternion

from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry, Path
from morai_msgs.msg import EgoVehicleStatus

class pure_pursuit:
    def __init__(self):


        rospy.init_node('pure_pursuit', anonymous=True)

        rospy.Subscriber("/local_path", Path, self.path_callback)
        rospy.Subscriber("/odom", Odometry, self.odom_callback)
        rospy.Subscriber("/Ego_topic", EgoVehicleStatus, self.status_callback)

        self.is_path = False
        self.is_odom = False
        self.is_status = False

        self.forward_point = Point()
        self.current_postion = Point()

        self.vehicle_length = 4.355  # morive kia niro (hev)
        self.lfd = 3
        self.min_lfd = 5
        self.max_lfd = 80  # morive default 30
        self.lfd_gain = 1.2  # morive default 0.78

    def path_callback(self, msg):
        self.is_path = True
        self.path = msg

    def odom_callback(self, msg):
        self.is_odom = True
        odom_quaternion = (msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z,
                           msg.pose.pose.orientation.w)
        _, _, self.vehicle_yaw = euler_from_quaternion(odom_quaternion)
        self.current_postion.x = msg.pose.pose.position.x
        self.current_postion.y = msg.pose.pose.position.y

    def status_callback(self, msg):  ## Vehicl Status Subscriber
        self.is_status = True
        self.status_msg = msg
        self.global_path = msg
        self.is_global_path = True

    def get_current_waypoint(self, ego_status, global_path):
        min_dist = float('inf')
        currnet_waypoint = -1
        for i, pose in enumerate(global_path.poses):
            dx = ego_status.position.x - pose.pose.position.x
            dy = ego_status.position.y - pose.pose.position.y

            dist = sqrt(pow(dx, 2) + pow(dy, 2))
            if min_dist > dist:
                min_dist = dist
                currnet_waypoint = i
        return currnet_waypoint

    def calc_pure_pursuit(self, ):

        self.lfd = (self.status_msg.velocity.x) * self.lfd_gain

        if self.lfd < self.min_lfd:
            self.lfd = self.min_lfd
        elif self.lfd > self.max_lfd:
            self.lfd = self.max_lfd

        vehicle_position = self.current_postion
        self.is_look_forward_point = False

        translation = [vehicle_position.x, vehicle_position.y]

        trans_matrix = np.array([
            [cos(self.vehicle_yaw), -sin(self.vehicle_yaw), translation[0]],
            [sin(self.vehicle_yaw), cos(self.vehicle_yaw), translation[1]],
            [0, 0, 1]])

        det_trans_matrix = np.linalg.inv(trans_matrix)

        for num, i in enumerate(self.path.poses):
            path_point = i.pose.position

            global_path_point = [path_point.x, path_point.y, 1]
            local_path_point = det_trans_matrix.dot(global_path_point)

            if local_path_point[0] > 0:
                dis = sqrt(pow(local_path_point[0], 2) + pow(local_path_point[1], 2))
                if dis >= self.lfd:
                    self.forward_point = path_point
                    self.is_look_forward_point = True
                    break

        theta = atan2(local_path_point[1], local_path_point[0])
        steering = atan2((2 * self.vehicle_length * sin(theta)), self.lfd)
        
        return steering
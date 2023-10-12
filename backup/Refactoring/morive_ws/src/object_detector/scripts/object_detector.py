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

class object_detector:
    def __init__(self):

        rospy.init_node('object_detector', anonymous=True)

        rospy.Subscriber("/Ego_topic", EgoVehicleStatus, self.status_callback)
        rospy.Subscriber("/Object_topic", ObjectStatusList, self.object_callback)

    def object_callback(self, msg):
        self.is_object = True
        self.object_msg = msg
    
    def status_callback(self, msg):  ## Vehicle Status Subscriber
        self.is_status = True
        self.status_msg = msg

    def nearest_cost(self):
    
        npc_positions = np.array([(object.position.x, object.position.y) for object in self.object_msg.npc_list])
        ego_position = np.array([self.status_msg.position.x, self.status_msg.position.y])

        squared_distances = np.sum((npc_positions - ego_position) ** 2, axis=1)
        if squared_distances.size == 0:
            nearest_dis = 90000.0
            heading_difference = 0.0
        else:
            nearest_index = np.argmin(squared_distances)
            nearest_dis = squared_distances[nearest_index]
            heading_difference = abs(self.object_msg.npc_list[nearest_index].heading - self.status_msg.heading)

        return nearest_dis, heading_difference
        

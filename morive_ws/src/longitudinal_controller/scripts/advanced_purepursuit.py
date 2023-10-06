#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import rospy
from math import cos, sin, pi, sqrt, pow, atan2
import numpy as np
from tf.transformations import euler_from_quaternion

from geometry_msgs.msg import Point
from nav_msgs.msg import Odometry, Path
from morai_msgs.msg import CtrlCmd, EgoVehicleStatus, ObjectStatusList


# advanced_purepursuit 은 차량의 차량의 종 횡 방향 제어 예제입니다.
# Purpusuit 알고리즘의 Look Ahead Distance 값을 속도에 비례하여 가변 값으로 만들어 횡 방향 주행 성능을 올립니다.
# 횡방향 제어 입력은 주행할 Local Path (지역경로) 와 차량의 상태 정보 Odometry 를 받아 차량을 제어 합니다.
# 종방향 제어 입력은 목표 속도를 지정 한뒤 목표 속도에 도달하기 위한 Throttle control 을 합니다.
# 종방향 제어 입력은 longlCmdType 1(Throttle control) 이용합니다.

# 노드 실행 순서
# 1. subscriber, publisher 선언
# 2. 속도 비례 Look Ahead Distance 값 설정
# 3. 좌표 변환 행렬 생성
# 4. Steering 각도 계산
# 5. PID 제어 생성
# 6. 도로의 곡률 계산
# 7. 곡률 기반 속도 계획
# 8. 제어입력 메세지 Publish

class park:
    def __init__(self):
        rospy.init_node('park', anonymous=True)

        # TODO: (1) subscriber, publisher 선언

        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd', CtrlCmd, queue_size=1)
        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        while True:
            self.ctrl_cmd_msg.brake = 1.0
            self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)


class pure_pursuit:
    def __init__(self):
        rospy.init_node('pure_pursuit', anonymous=True)

        # TODO: (1) subscriber, publisher 선언
        rospy.Subscriber("/global_path", Path, self.global_path_callback)
        rospy.Subscriber("/lattice_path", Path, self.path_callback)

        rospy.Subscriber("/odom", Odometry, self.odom_callback)
        rospy.Subscriber("/Ego_topic", EgoVehicleStatus, self.status_callback)
        rospy.Subscriber("/Object_topic", ObjectStatusList, self.object_callback)
        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd', CtrlCmd, queue_size=1)

        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        self.is_path = False
        self.is_odom = False
        self.is_status = False
        self.is_global_path = False

        self.is_look_forward_point = False

        self.forward_point = Point()
        self.current_postion = Point()

        self.vehicle_length = 4.355  # morive kia niro (hev)
        self.wheel_length = 3.5
        self.lfd = 3
        self.min_lfd = 5
        self.max_lfd = 80  # morive default 30
        self.lfd_gain = 1.0  # morive default 0.78
        self.target_velocity = 40  # morive max_speed": 60, default : 40

        self.pid = pidControl()
        self.vel_planning = velocityPlanning(self.target_velocity / 3.6, 0.15)
        while True:
            if self.is_global_path == True:
                self.velocity_list = self.vel_planning.curvedBaseVelocity(self.global_path, 50)
                break
            else:
                rospy.loginfo('Waiting global path data')

        rate = rospy.Rate(30)  # 30hz
        while not rospy.is_shutdown():

            if self.is_path == True and self.is_odom == True and self.is_status == True:
                prev_time = time.time()

                self.current_waypoint = self.get_current_waypoint(self.status_msg, self.global_path)
                self.target_velocity = self.velocity_list[self.current_waypoint] * 3.6

                steering = self.calc_pure_pursuit()
                if self.is_look_forward_point:
                    self.ctrl_cmd_msg.steering = steering
                else:
                    rospy.loginfo("no found forward point")
                    self.ctrl_cmd_msg.steering = steering #0.0 last

                output = self.pid.pid(self.target_velocity, self.status_msg.velocity.x * 3.6)

                # heading, nearest
                dis_list = []
                for object in self.object_msg.npc_list:
                    dis_list.append(sqrt(pow(self.status_msg.position.x - object.position.x, 2) +
                                         pow(self.status_msg.position.y - object.position.y, 2)))
                nearest_dis = min(dis_list)
                nearest_index = dis_list.index(nearest_dis)
                heading_difference = abs(self.object_msg.npc_list[nearest_index].heading - self.status_msg.heading)

                #(x,y)case
                #line change
                if (self.status_msg.position.x > 160.0 and self.status_msg.position.x < 230.0 
                    and self.status_msg.position.y > 1020.0 and self.status_msg.position.y <1780.0 ):
                    
                    print('case 2')
                    print('case 2')
                    print('case 2')
                    print('case 2')
                    print('case 2')
                    print('case 2')
                    print('case 2')
                    print('case 2')

                    # same heading degree
                    if heading_difference > 1.0:
                        if nearest_dis < 5.0:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = 1.0
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')
                            print('brake')

                        else:
                            if output > 0.0:
                                self.ctrl_cmd_msg.accel = output
                                self.ctrl_cmd_msg.brake = 0.0

                            # morive brake tunning
                            elif -0.5 < output <= 0.0:
                                self.ctrl_cmd_msg.accel = 0.0
                                self.ctrl_cmd_msg.brake = 0.0

                            else:
                                self.ctrl_cmd_msg.accel = 0.0
                                self.ctrl_cmd_msg.brake = -output
                    else:
                        if output > 0.0:
                            self.ctrl_cmd_msg.accel = output
                            self.ctrl_cmd_msg.brake = 0.0

                        # morive brake tunning
                        elif -0.5 < output <= 0.0:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = 0.0

                        else:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = -output
                #before circle
                elif (self.status_msg.position.x > -22.0 and self.status_msg.position.x < 57.0
                    and self.status_msg.position.y > 960.0 and self.status_msg.position.y <990.0):

                    print('case 3-1')
                    print('case 3-1')
                    print('case 3-1')
                    print('case 3-1')
                    print('case 3-1')
                    print('case 3-1')

                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = output/15.0
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output

                #circle
                elif (self.status_msg.position.x > -27.0 and self.status_msg.position.x < -14.0
                    and self.status_msg.position.y > 800.0 and self.status_msg.position.y <1030.0):


                    print('case 3')
                    print('case 3')
                    print('case 3')
                    print('case 3')
                    print('case 3')
                    print('case 3')
                    print('case 3')
                    print('case 3')

                    if nearest_dis > 14.0:
                        if output > 0.0:
                            self.ctrl_cmd_msg.accel = output/15.0
                            self.ctrl_cmd_msg.brake = 0.0

                        else:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = -output
                        print('brake')
                        print('brake')
                        print('brake')
                        print('nearest_dis',nearest_dis)
                        print('nearest_dis',nearest_dis)
                        print('nearest_dis',nearest_dis)

                    elif nearest_dis > 8.0:

                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = 1.0

                        print('brake')
                        print('brake')
                        print('brake')
                        print('nearest_dis',nearest_dis)
                        print('nearest_dis',nearest_dis)
                        print('nearest_dis',nearest_dis)


                    else:
                        if output > 0.0:
                            self.ctrl_cmd_msg.accel = output/15.0
                            self.ctrl_cmd_msg.brake = 0.0

                        else:
                            self.ctrl_cmd_msg.accel = 0.0
                            self.ctrl_cmd_msg.brake = -output

                #before parking
                elif (self.status_msg.position.x > -24.0 and self.status_msg.position.x < 4.0
                    and self.status_msg.position.y > 1020.0 and self.status_msg.position.y <1075.0):

                    print('case 4')
                    print('case 4')
                    print('case 4')
                    print('case 4')
                    print('case 4')
                    print('case 4')
                    print('case 4')
                    print('case 4')


                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = output/50.0
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output


                #parking
                elif (self.status_msg.position.x > -15.0 and self.status_msg.position.x < 45.0
                    and self.status_msg.position.y > 1010.0 and self.status_msg.position.y <1075.0):
                    

                    print('case 5')
                    print('case 5')
                    print('case 5')
                    print('case 5')

                    print('steering', steering)
                    print('steering', steering)
                    print('steering', steering)
                    print('steering', steering)
                    print('steering', steering)

                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = output/60.0                   
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output
                
                else:
                    print('case 1')
                    print('case 1')
                    print('case 1')
                    print('case 1')
                    print('case 1')
                    print('case 1')
                    print('case 1')
                    print('case 1')

                    if output > 0.0:
                            self.ctrl_cmd_msg.accel = output
                            self.ctrl_cmd_msg.brake = 0.0

                    # morive brake tunning
                    elif -0.5 < output <= 0.0:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = 0.0

                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = -output

                speeds = sqrt(pow(self.status_msg.velocity.x,2)+pow(self.status_msg.velocity.y,2))
                print('speed', speeds)
                print('speed', speeds)
                print('speed', speeds)
                print('speed', speeds)
                print('speed', speeds)
                print('speed', speeds)

                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)

            rate.sleep()

    def path_callback(self, msg):
        self.is_path = True
        self.path = msg

    def object_callback(self, msg):
        self.is_object = True
        self.object_msg = msg

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

    def global_path_callback(self, msg):
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

        # TODO: (2) 속도 비례 Look Ahead Distance 값 설정
        self.lfd = (self.status_msg.velocity.x) * self.lfd_gain

        if self.lfd < self.min_lfd:
            self.lfd = self.min_lfd
        elif self.lfd > self.max_lfd:
            self.lfd = self.max_lfd
        rospy.loginfo(self.lfd)

        vehicle_position = self.current_postion
        self.is_look_forward_point = False

        translation = [vehicle_position.x, vehicle_position.y]

        # TODO: (3) 좌표 변환 행렬 생성
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

        # TODO: (4) Steering 각도 계산
        theta = atan2(local_path_point[1], local_path_point[0])
        steering = atan2((2 * self.vehicle_length * sin(theta)), self.lfd)
        
        return steering


class pidControl:
    def __init__(self):
        self.p_gain = 0.3  # defalt 0.3
        self.i_gain = 0.00
        self.d_gain = 0.1  # defalt 0.03
        self.prev_error = 0
        self.i_control = 0
        self.controlTime = 0.02

    def pid(self, target_vel, current_vel):
        error = target_vel - current_vel

        # TODO: (5) PID 제어 생성
        p_control = self.p_gain * error
        self.i_control += self.i_gain * error * self.controlTime
        d_control = self.d_gain * (error - self.prev_error) / self.controlTime

        output = p_control + self.i_control + d_control
        self.prev_error = error

        return output


class velocityPlanning:
    def __init__(self, car_max_speed, road_friciton):
        self.car_max_speed = car_max_speed
        self.road_friction = road_friciton

    def curvedBaseVelocity(self, gloabl_path, point_num):
        out_vel_plan = []

        for i in range(0, point_num):
            out_vel_plan.append(self.car_max_speed)

        for i in range(point_num, len(gloabl_path.poses) - point_num):
            x_list = []
            y_list = []
            for box in range(-point_num, point_num):
                x = gloabl_path.poses[i + box].pose.position.x
                y = gloabl_path.poses[i + box].pose.position.y
                x_list.append([-2 * x, -2 * y, 1])
                y_list.append((-x * x) - (y * y))

            # TODO: (6) 도로의 곡률 계산
            x_matrix = np.array(x_list)
            y_matrix = np.array(y_list)
            x_trans = x_matrix.T

            a_matrix = np.linalg.inv(x_trans.dot(x_matrix)).dot(x_trans).dot(y_matrix)
            a = a_matrix[0]
            b = a_matrix[1]
            c = a_matrix[2]
            r = sqrt(a * a + b * b - c)

            # TODO: (7) 곡률 기반 속도 계획
            v_max = sqrt(r * 9.8 * self.road_friction)

            if v_max > self.car_max_speed:
                v_max = self.car_max_speed
            out_vel_plan.append(v_max)

        for i in range(len(gloabl_path.poses) - point_num, len(gloabl_path.poses) - 10):
            out_vel_plan.append(30)

        for i in range(len(gloabl_path.poses) - 10, len(gloabl_path.poses)):
            out_vel_plan.append(0)

        return out_vel_plan


if __name__ == '__main__':
    try:
        test_track = pure_pursuit()
        test_park = park()

    except rospy.ROSInterruptException:
        pass

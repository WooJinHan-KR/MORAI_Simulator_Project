# ad-control1-finalproject-team4
자율주행 데브코스 제어 1기 최종프로젝트 - 4팀 - jungchunpark

# <제어 튜닝>

## 0. 차량 정보 수정.

rostopic echo Object_topic 으로 npc_list 로 niro 차량정보를 받을 수 있었다.

차량길이 4.355 를 적용하기 위해 ego_vehicle을 niro 로 교체하였다.

(수정전)
  
self.vehicle_length = 3.16 (임의값)
   
(수정후)		
  
	self.vehicle_length = 4.355 # morive kia niro (hev)



## 1. 브레이크 민감하게 작동하는 문제.

ctrl_msg
accel, brake = 0 ~ 1

해결방법 : brake를 0 ~ 0.5 까지 무시하는 코드 추가.

(수정전)       
  
  	if output > 0.0:
                self.ctrl_cmd_msg.accel = output
                self.ctrl_cmd_msg.brake = 0.0

        else:
        	self.ctrl_cmd_msg.accel = 0.0
                self.ctrl_cmd_msg.brake = -output

(수정후)       
  
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



## 2. S자 주행하는 문제.

### 2-1. PD gain값 수정.

overshooting 문제인가 싶어서 p_gain을 줄여봤지만 실패.

ocilation 문제인가 싶어서 d_gain을 키워봤다. 

초반 합류구간에서는 성능이 나아졌지만, 톨게이트 통과 이후 나아지지 않았음.

(수정전)

	p_gain = 0.3
	d_gain = 0.03

(수정후)

	p_gain = 0.3
	d_gain = 0.1
	
### 2-2. lfd_gain 값 수정.
		
lfd 가 너무 작을 때, 진동하는 문제가 있음을 인지.

lfd_gain 을 2.0으로 키워서 lfd를 속도의 2배크기로 설정하였다. 

결과 : S자 주행은 해결했지만 변화에 둔감하다고 판단.

따라서 lfd_gain 을 1.0으로 수정.

(수정전)

	self.lfd_gain = 0.78
   
(수정후)
 
	self.lfd_gain = 1.0 # morive default 0.78
   

### 2-3. max_lfd 값 수정.
	
lfd_gain 값을 수정하였으므로 max_lfd가 부족하지 않게 설정.

#lfd_gain 2.0, target_velocity = 40 에 맞게 설정.

#이후 lfd_gain 1.0, target_velocity = 60에 맞게 수정 필요(?)

(수정전)

	self.max_lfd = 30
   
(수정후)

	self.max_lfd = 80 # morive default 30
   
		


## 4. 오른쪽 차선에 치우쳐서 주행하는 문제.

morai 에서 받아오는 gps 센서의 위치가 문제일 거라고 생각해서 gps센서를 오른쪽으로 치우쳐서 부착. 

해결.

		
## 5. target_velocity 수정

link_set.json의 max_speed : 60 을 기반으로  target_velocity 를 증가시켰다.

(수정전)		
 
 	self.target_velocity = 40
   
(수정후)		
 
 	self.target_velocity = 60 # morive max_speed": 60, default : 40

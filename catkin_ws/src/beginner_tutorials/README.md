# 1. 버전 내역

### [0309]

- **[삭제]**  `ex_calib_velodyne3`

  - 미사용되는 코드임.

- **[수정]**  `lane_bev`, `lane_binarize`, `lane_fitting`, `lane_roi`

  - fromstring() 함수 사용시, deprecated warning 발생

    따라서 fromstring() 을 frombuffer() 로 변경

- **[수정]** blank 위치 및 내용 조정, 아래 **상세내용** 참조 바람.

<br><br>

<br>

# 2. 상세 내용

<br>

## - s_drive.py

```python
from morai_msgs.msg import <<>>

class s_drive():
    def __init__(self):
        rospy.init_node('s_drive', anonymous=True)
        cmd_pub = rospy.Publisher(<<>>, <<>>, queue_size=1)
        rate = rospy.Rate(30)
        cmd = <<>>
        cmd.longlCmdType = <<>>
        cmd.velocity = <<>>
        steering_cmd = [ <<>>, <<>>]
        cmd_cnts = <<>>
```

학습내용을 바탕으로 <<>> 를 채우는 예제 입니다.

<br>

<br>

## - pure_pursuit 관련 내용

<br>

**`pure_pursuit.py` line 31 ~ 32**

```python
print("you need to change values at line 32~33 ,  self.vegicle_length , lfd")
self.vehicle_length=0
self.lfd=0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산할때 필요한 차량의 축거와 전방주시거리 입니다.

**`pure_pursuit.py` line 69 ~ 70**

```python
print("you need to change the value at line 70")
self.ctrl_cmd_msg.steering=0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산합니다.

<br>

**`pid_purepursuit.py` line 59 ~ 61**

```python
print("you need to change values at line 60 ~ 61 :  vegicle_length , lfd")
self.vehicle_length = 0
self.lfd = 0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산할때 필요한 차량의 축거와 전방주시거리 입니다.

**`pid_purepursuit.py` line 98**

```python
self.ctrl_cmd_msg.steering = None
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산합니다.

<br>

**`advanced_purepursuit.py` line 55 ~ 56**

```python
self.vehicle_length = 0
self.lfd = 0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산할때 필요한 차량의 축거와 전방주시거리 입니다.

**`advanced_purepursuit.py` line 172 ~ 175**

```python
#TODO: (4) Steering 각도 계산
theta = atan2(local_path_point[1],local_path_point[0])
print("you need to change pure_pursuit_calcu_steering")
steering = 0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산합니다.

<br>

**`lane_follower.py` line 28**

```python
ctrller = purePursuit(lfd=0)
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산할때 필요한 차량의 전방주시거리 (m) 입니다.

<br>

**`util.py` line 481 ~ 482**

```python
print("you need to change value at line 482 : purepursuit_steering")
steering_deg= 0
```

purepursuit 알고리즘을 이용하여 제어할 조향각을 계산합니다.

<br>

<br>

## - 차선인지 관련 내용

<br>        

**`lane_binarize.py` line 27 ~ 29**

```python
print("you need to find the right value : line 28 ~ 29")
lower_wlane = np.array([0,0,0])
upper_wlane = np.array([0,0,0])
```

흰색 차선을 제외한 나머지 부분은 제외하기 위한 설정 입니다.

따라서 흰색에 해당하는 범위를 찾아 넣으면 됩니다. 

<br>

**`lane_fitting.py` line 22 ~ 29**

```python
print("you need to find the right value : line 23 ~ 29")
self.lower_wlane = np.array([0,0,0])
self.upper_wlane = np.array([0,0,0])

self.lower_ylane = np.array([0,0,0])
self.upper_ylane = np.array([0,0,0])

self.crop_pts = np.array([[[0,0],[0,0],[0,0],[0,0]]])
```

흰색과 노란색 선을 제외한 나머지 부분은 제외하기 위한 설정 입니다.

crop_pts 는 관심영역(ROI) 외엔 마스킹(잘라내기 위한)처리를 위한 구간 설정 입니다.

<br>

**`lane_roi.py` line 19 ~ 22** 

```python
print("you need to find the right value : line 19 ~ 22")
self.crop_pts = np.array(
            [[
                [0,0],
                [0,0],
                [0,0],
                [0,0]
            ]]
        )
```

crop_pts 는 관심영역(ROI) 외엔 마스킹(잘라내기 위한)처리를 위한 구간 설정 입니다.

<br>


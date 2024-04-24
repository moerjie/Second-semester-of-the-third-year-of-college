# HFSS结课作业报告

报告要求同轴线的特性阻抗为$50\Omega$, 外导体直径为$96mm$,根据计算公式可以算出内导体直径为$29.54mm$

## 1.不带四氟支撑的同轴线

### 模型建立

1.   建立同轴线的外壁和内壁

​	内壁参数![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1713318215257.png)

其中内部轴线的材料为copper铜

外壁参数

![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/utool_pic/1713318279306.png)

2.   设置Pefect E表面和激励端口

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404170946001.png" alt="image-20240417094613918" style="zoom: 50%;" />

外部的真空柱的侧表面设置为PEC

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404170947592.png" alt="image-20240417094713525" style="zoom:50%;" />

外部真空柱的上下表面设置为激励端口,默认即可

### 频率设置

![image-20240417100024384](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171000422.png)

迭代次数为20

扫频设置

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171006893.png" alt="image-20240417100638842" style="zoom:80%;" />

### 仿真结果

![image-20240417100844703](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171008257.png)

可以看到在整个扫频的范围里面$S(1,1)$参数都低于$-50dB$, 满足要求

## 2.带四氟支撑的同轴线

因为要在同轴线内部添加支撑片, 所以内部轴线要凹陷一部分, 用以卡住支撑片

### 模型建立

1.   建立内部轴线

![image-20240417104740542](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171047608.png)

首先建立中心的较细的圆柱, 再在两侧建立较粗的圆柱, 合并后就可以形成一个带卡口的轴线

2.   建立内部支撑片

![image-20240417110335356](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171103398.png)

建立一个半径和外部空气柱相等的圆柱, 然后与内部轴线相减,即可得到支撑片

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171104950.png" alt="image-20240417110446891" style="zoom:67%;" />

3.   外部空气柱建立

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171106890.png" alt="image-20240417110653834" style="zoom:67%;" />

直径为96, 长度为200+8mm

4.   在支撑片上打孔

建立一个和支撑片中心重合的圆柱, 然后平移一段距离, 再沿着y轴复制8个, 与支撑片进行相减操作,即可在支撑片上打孔

![image-20240417111912184](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171119229.png)

### 频率和激励设置

频率和激励设置同上



### 仿真结果

![image-20240419105122898](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404191051960.png)

对支撑部分的半径进行扫参，可以看到当半径为$8.5mm$时端口回波损耗最低

![image-20240417113529608](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404171135666.png)

固定打孔位置, 对打孔半径进行扫参可以发现, 当打孔半径为$9mm$时, 端口反射损耗较小

![image-20240417211152185](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404172111254.png)

固定打孔的半径为$9mm$, 当打孔距离中心$25mm$时在要求的频率内端口反射损耗最小

## 3.不带四氟支撑的直角弯头

### 模型建立

1.   首先建立外部轴线，在YZ面上新建一个圆柱，将圆柱的底面圆的边平移到坐标系的原点，然后，以Z轴为旋转轴旋转45°，使用split命令将YZ面以下的部分切除，即可得到直角弯头的其中一个边
2.   选中刚才建立的有一个斜面的圆柱，使用Along Axis命令以Z轴为旋转轴旋转复制出另一个直角弯头的直角边，将其旋转平移使得两个斜面重合即可得到直角弯头的外部
3.   使用同样的方法建立直角弯头的内部传输线

4.   由于内部圆柱拐弯的地方是一个直角的话回波系数会很大，因此要在拐角处切割一下，因此建立一个矩形面，分别与X、Y轴成45°，再选中内部圆柱和该平面使用Split命令，即可得到切割后的模型

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404181044941.png" alt="image-20240418104446869" style="zoom:50%;" />

### 激励、频率设置

![image-20240418105200533](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404181052575.png)

### 仿真结果

![image-20240418105643792](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404181056860.png)

对矩形面的切割深度进行扫参，可以看出当矩形面沿$x轴$平移$27mm$时在要求的频率范围内符合端口反射损耗<-35dB

## 4. 带四氟支撑的直角弯头

### 模型建立

1.   利用建立模型2-带四氟支撑的同轴线的步骤建立一个直角弯头的壁，细脖子的半径为$8.5mm$，打孔的半径为$9mm$, 打孔圆心距离轴线中心的距离为$25mm$
2.   同建立模型3-直角弯头的步骤，对第一步建立好的同轴线进行旋转、切割、复制，即可得到带四氟支撑的直角弯头

<img src="https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404191056636.png" alt="image-20240419105602546" style="zoom:67%;" />
### 仿真结果分析
#### 对内导体拐角处切割深度进行扫参
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404241921297.png)
得到的结果如下图所示
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404241922091.png)
回波损耗很大，对支撑柱的直径扫参同样回波损耗极大
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404241955955.png)
将外部波导改为圆弧拐弯，但是回波损耗改善不大
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404241958463.png)

## 5. 不带四氟支撑的 U_Link
### 模型建立
将模型 3-直角弯头复制到新建的hfss 文件下，然后使用工具栏中的mirror 功能
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404242010262.png)
将直角弯头沿 x 轴对称过去，unite 后即可得到U_Link

### 仿真结果分析
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404242015900.png)
可以看出，当切割深度为 $27mm$ 时回波损耗满足要求，别的长度会有两个匹配的传输频率，但是带宽不够。因此，当需要传输频带较窄的信号时可以使用 $27mm$ 以外的切割深度，当传输宽带信号时使用 $27mm$ 
## 6.带四氟支撑的 U_Link
### 模型建立
将模型 4 中的带四氟支撑的直角弯头复制到新建的工程中，然后mirror 后将新生成的内部波导和外部波导合并后即可得到带四氟支撑的 U_Link
![|575](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404242027493.png)
### 仿真结果分析
![](https://sawen-pic-blog.oss-cn-beijing.aliyuncs.com/pic/202404242038370.png)
可以看到此时的U_Link 有一定的频率选择功能，调节切割深度回波损耗几乎不变
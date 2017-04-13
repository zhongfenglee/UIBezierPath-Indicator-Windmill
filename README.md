# UIBezierPath-Indicator-Windmill
### 说明 Introduction ###
使用UIBezierPath（贝塞尔路径）画出的指示器、风车，可根据给出的数值指示到对应的角度或转的快慢，均带有动画。
Use UIBezierPath to draw the indicator and windmill, according to the value is given to indicate to a corresponding angle or the speed of rotation, both with animation.

效果图（picture）：
![](https://github.com/zhongfenglee/UIBezierPath-Indicator-Windmill/blob/master/Screenshot/Animated-Indicator:Windmill.png?raw=true "Animated-Indicator/Windmill")


### 使用 ###
```    
    // 指示器
    DialView *dv = [[DialView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    dv.percent = 300;// 根据不同的数值指示到不同的角度
    [self.view addSubview:dv];
    
    // 风车
    WindmillView *windmillView = [[WindmillView alloc] initWithFrame:CGRectMake(100, 350, 150, 150)];
    windmillView.duration = 1;// duration: 转到规定的角度所需要的时间（本风车转到2pi），即周期，duration越小，转速越快
    [self.view addSubview:windmillView];

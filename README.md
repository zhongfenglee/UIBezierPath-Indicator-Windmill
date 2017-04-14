# UIBezierPath-Indicator-Windmill
## 说明 Introduction
使用UIBezierPath（贝塞尔路径）画出的指示器、风车，可根据给出的数值指示到对应的角度或转的快慢，均带有动画。
Use UIBezierPath to draw the indicator and windmill, according to the value is given to indicate to a corresponding angle or the speed of rotation, both with animation.

效果图（picture）：
![](https://github.com/zhongfenglee/UIBezierPath-Indicator-Windmill/blob/master/Screenshot/36D5207E4FDB1BBED8A796F802E0EFD3.gif?raw=true "Animated-Indicator/Windmill")


## 使用 Use
```    
    // 指示器
    DialView *dv = [[DialView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    dv.percent = 300;// 根据不同的数值指示到不同的角度
    [self.view addSubview:dv];
    
    // 风车
    WindmillView *windmillView = [[WindmillView alloc] initWithFrame:CGRectMake(100, 350, 150, 150)];
    windmillView.duration = 1;// duration: 转到规定的角度所需要的时间（本风车转到2pi），即周期，duration越小，转速越快
    [self.view addSubview:windmillView];
```

## 联系我 Contact Me
如果您觉得本Demo好用，请为我加星，非常感谢，🙏！&nbsp;如果您有什么疑问/建议，非常欢迎联系我，🙏！

QQ/微信: 852354291&nbsp;&nbsp;&nbsp;&nbsp;Email: 852354291@qq.com

Please Star Me, Follow Me, Thank You!😊

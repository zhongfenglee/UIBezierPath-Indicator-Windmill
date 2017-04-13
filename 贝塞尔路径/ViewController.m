//
//  ViewController.m
//  贝塞尔路径
//
//  Created by zhongfeng1 on 2017/3/30.
//  Copyright © 2017年 zhongfeng. All rights reserved.
//

#import "ViewController.h"
#import "WindmillView.h"
#import "DialView.h"

@interface ViewController ()

@end

@implementation ViewController

#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    // 指示器
    DialView *dv = [[DialView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    dv.percent = 300;// 根据不同的数值指示到不同的角度
    [self.view addSubview:dv];
    
    // 风车
    WindmillView *windmillView = [[WindmillView alloc] initWithFrame:CGRectMake(100, 350, 150, 150)];
    windmillView.duration = 1;// duration: 转到规定的角度所需要的时间（本风车转到2pi），即周期，duration越小，转速越快
    [self.view addSubview:windmillView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

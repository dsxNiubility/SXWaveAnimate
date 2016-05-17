//
//  SXViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/25.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaterViewDemoPage.h"
#import "SXWaveView.h"  // -----步骤1 引入自定义view头文件
#import "SXHalfWaveView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SIDES SCREEN_WIDTH/3.5
#define MARGIN SCREEN_WIDTH/28
#define COLOR(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]

@interface SXWaterViewDemoPage ()

@property(nonatomic,strong)SXWaveView *animateView1; // ------步骤2 建一个成员变量
@property(nonatomic,strong)SXWaveView *animateView2;
@property(nonatomic,strong)SXWaveView *animateView3;
@property(nonatomic,strong)SXWaveView *animateView4;
@property(nonatomic,strong)SXWaveView *animateView5;
@property(nonatomic,strong)SXWaveView *animateView6;
@property(nonatomic,strong)SXWaveView *animateView7;
@property(nonatomic,strong)SXWaveView *animateView8;
@property(nonatomic,strong)SXWaveView *animateView9;

@property(nonatomic,strong)SXHalfWaveView *animateView10;
@property(nonatomic,strong)SXHalfWaveView *animateView11;
@property(nonatomic,strong)SXHalfWaveView *animateView12;
@property(nonatomic,strong)SXHalfWaveView *animateView13;

@end

@implementation SXWaterViewDemoPage

- (void)viewDidLoad {
    [super viewDidLoad];

// ------------------------------
    // 步骤3 初始化并使用set方法
    self.animateView1 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN,SIDES, SIDES)];
    [self.animateView1 setPrecent:self.precent description:@"董铂然" textColor:[UIColor lightGrayColor]];
    [self.view addSubview:_animateView1];
// ------------------------------
    
    
// ------------------------------
    // 也是步骤3 更多属性等你发现
    self.animateView2 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN,SIDES, SIDES)];
    [self.animateView2 setPrecent:self.precent description:@"sx"];
    [self.animateView2 setAlpha:0.8 clips:YES endless:YES];
    [self.animateView2 setTextColor:[UIColor redColor] bgColor:COLOR(31, 187, 170, 1) waterColor:[UIColor orangeColor]];
    [self.animateView2 setUpdating:YES];
    [self.view addSubview:_animateView2];
// ------------------------------
    
    // 下面都是重复的代码，相当于多个重复的步骤3
    self.animateView3 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN,SIDES, SIDES)];
    self.animateView4 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    self.animateView5 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    self.animateView6 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    self.animateView7 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    self.animateView8 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    self.animateView9 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    
    [self.view addSubview:_animateView3];
    [self.view addSubview:_animateView4];
    [self.view addSubview:_animateView5];
    [self.view addSubview:_animateView6];
    [self.view addSubview:_animateView7];
    [self.view addSubview:_animateView8];
    [self.view addSubview:_animateView9];
    
    [self.animateView3 setPrecent:self.precent description:@"sx" textColor:[UIColor redColor] bgColor:[UIColor grayColor] alpha:0.9 clips:NO];
    self.animateView3.waterColor = [UIColor yellowColor];
    [self.animateView3 setUpdating:YES];
    [self.animateView4 setPrecent:self.precent description:@"sx" textColor:COLOR(19, 118, 107, 1) bgColor:COLOR(31, 187, 170, 1) alpha:0.7 clips:YES];
    self.animateView4.waterColor = [UIColor redColor];
    [self.animateView5 setPrecent:self.precent description:@"sx" textColor:[UIColor blackColor] bgColor:[UIColor redColor] alpha:0.5 clips:YES];
    [self.animateView5 setUpdating:YES];
    [self.animateView6 setPrecent:self.precent description:@"sx" textColor:[UIColor redColor] bgColor:[UIColor darkGrayColor] alpha:0.5 clips:YES];
    [self.animateView6 setUpdating:YES];
    [self.animateView7 setPrecent:self.precent description:@"sx" textColor:COLOR(56, 13, 49, 1) bgColor:COLOR(114, 111, 128, 1) alpha:0.5 clips:NO];
    [self.animateView8 setPrecent:self.precent description:@"sx" textColor:COLOR(151, 173, 172, 1) bgColor:COLOR(255, 94, 72, 1) alpha:1 clips:YES];
    self.animateView8.endless = YES;
    [self.animateView9 setPrecent:self.precent description:@"sx" textColor:COLOR(255, 222, 0, 1) bgColor:COLOR(0, 90, 117, 1) alpha:0.2 clips:NO];
    self.animateView9.endless = YES;
    
    
    // ------下面是半圆形的demo
    CGFloat lastMargin = (SCREEN_WIDTH - SIDES*2)/5;
    self.animateView10 = [[SXHalfWaveView alloc]initWithFrame:CGRectMake(lastMargin, 100+MARGIN*7+SIDES*3,SIDES/2, SIDES)];
    self.animateView10.endless = YES;

    [self.view addSubview:_animateView10];
    [self.animateView10 setPrecent:self.precent description:@"sx" textColor:COLOR(214, 200, 75, 1) bgColor:COLOR(38, 188, 213, 1) alpha:1];
    
    self.animateView11 = [[SXHalfWaveView alloc]initWithFrame:CGRectMake(self.animateView10.right + lastMargin, 100+MARGIN*7+SIDES*3,SIDES/2, SIDES)];
    [self.view addSubview:_animateView11];
    [self.animateView11 setPrecent:self.precent description:@"sx" textColor:COLOR(244, 13, 100, 1) bgColor:COLOR(244, 222, 41, 1) alpha:0.6];
    
    self.animateView12 = [[SXHalfWaveView alloc]initWithFrame:CGRectMake(self.animateView11.right + lastMargin, 100+MARGIN*7+SIDES*3,SIDES/2, SIDES)];
    [self.view addSubview:_animateView12];
    [self.animateView12 setPrecent:self.precent description:@"sx" textColor:COLOR(205, 179, 128, 1) bgColor:COLOR(53, 44, 10, 1) alpha:0.3];
    
    self.animateView13 = [[SXHalfWaveView alloc]initWithFrame:CGRectMake(self.animateView12.right + lastMargin, 100+MARGIN*7+SIDES*3,SIDES/2, SIDES)];
    [self.view addSubview:_animateView13];
    [self.animateView13 setPrecent:self.precent description:@"sx" textColor:COLOR(0, 90, 107, 1) bgColor:COLOR(107, 194, 53, 1) alpha:0.5];
    self.animateView13.endless = YES;
    
    
    // ------这里代码不相关
    self.title = @"WaveViewShow";
    self.view.backgroundColor = [UIColor colorWithRed:165/255.0 green:236/255.0 blue:229/255.0 alpha:1];
    UILabel *titlelabel1 = [[UILabel alloc]init];
    [self.view addSubview:titlelabel1];
    titlelabel1.frame = self.animateView2.frame;
    titlelabel1.centery = titlelabel1.top - 25;
    titlelabel1.font = [UIFont fontWithName:@"DIN Alternate" size:15];
    titlelabel1.text = @"c i r c l e";
    titlelabel1.textColor = COLOR(19, 118, 107, 1);
    titlelabel1.textAlignment = NSTextAlignmentCenter;
    UILabel *titlelabel2 = [[UILabel alloc]init];
    [self.view addSubview:titlelabel2];
    titlelabel2.frame = self.animateView11.frame;
    titlelabel2.width = 150;
    titlelabel2.centery = titlelabel2.top - 25;
    titlelabel2.centerx = titlelabel1.centerx;
    titlelabel2.font = [UIFont fontWithName:@"DIN Alternate" size:15];
    titlelabel2.text = @"s e m i - c i r c l e";
    titlelabel2.textColor = COLOR(19, 118, 107, 1);
    titlelabel2.textAlignment = NSTextAlignmentCenter;
}

- (void)viewWillAppear:(BOOL)animated
{
    // ------步骤4 设置动画
    [self.animateView1 addAnimateWithType:0];
    [self.animateView2 addAnimateWithType:0];
    [self.animateView3 addAnimateWithType:0];
    [self.animateView4 addAnimateWithType:1];
    [self.animateView5 addAnimateWithType:1];
    [self.animateView6 addAnimateWithType:1];
    [self.animateView7 addAnimateWithType:2];
    [self.animateView8 addAnimateWithType:2];
    [self.animateView9 addAnimateWithType:2];
    
    [self.animateView10 addAnimateWithType:0];
    [self.animateView11 addAnimateWithType:2];
    [self.animateView12 addAnimateWithType:1];
    [self.animateView13 addAnimateWithType:0];
}

@end

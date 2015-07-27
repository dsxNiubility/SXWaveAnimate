//
//  SXViewController.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/25.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXViewController.h"
#import "SXWaveView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SIDES SCREEN_WIDTH/3.5
#define MARGIN SCREEN_WIDTH/28
#define COLOR(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]
@interface SXViewController ()

@property(nonatomic,strong)SXWaveView *animateView1;
@property(nonatomic,strong)SXWaveView *animateView2;
@property(nonatomic,strong)SXWaveView *animateView3;
@property(nonatomic,strong)SXWaveView *animateView4;
@property(nonatomic,strong)SXWaveView *animateView5;
@property(nonatomic,strong)SXWaveView *animateView6;
@property(nonatomic,strong)SXWaveView *animateView7;
@property(nonatomic,strong)SXWaveView *animateView8;
@property(nonatomic,strong)SXWaveView *animateView9;


@end

@implementation SXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:165/255.0 green:236/255.0 blue:229/255.0 alpha:1];
    // ------设定了9个自定义样式的view

    SXWaveView *animateView1 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN,SIDES, SIDES)];
    [self.view addSubview:animateView1];
    self.animateView1 = animateView1;
    [self.animateView1 setPrecent:self.precent description:@"sx" textColor:[UIColor orangeColor] bgColor:COLOR(31, 187, 170, 1) alpha:1 clips:NO];
    
    SXWaveView *animateView2 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN,SIDES, SIDES)];
    [self.view addSubview:animateView2];
    self.animateView2 = animateView2;
    [self.animateView2 setPrecent:self.precent description:@"sx" textColor:COLOR(31, 187, 170, 1) bgColor:[UIColor orangeColor] alpha:0.5 clips:YES];
    
    SXWaveView *animateView3 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN,SIDES, SIDES)];
    [self.view addSubview:animateView3];
    self.animateView3 = animateView3;
    [self.animateView3 setPrecent:self.precent description:@"sx" textColor:[UIColor redColor] bgColor:[UIColor grayColor] alpha:0.9 clips:NO];
    
    SXWaveView *animateView4 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    [self.view addSubview:animateView4];
    self.animateView4 = animateView4;
    [self.animateView4 setPrecent:self.precent description:@"sx" textColor:COLOR(19, 118, 107, 1) bgColor:COLOR(31, 187, 170, 1) alpha:0.7 clips:YES];

    SXWaveView *animateView5 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    [self.view addSubview:animateView5];
    self.animateView5 = animateView5;
    [self.animateView5 setPrecent:self.precent description:@"sx" textColor:[UIColor blackColor] bgColor:[UIColor redColor] alpha:0.5 clips:YES];
    
    SXWaveView *animateView6 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN*2+SIDES,SIDES, SIDES)];
    [self.view addSubview:animateView6];
    self.animateView6 = animateView6;
    [self.animateView6 setPrecent:self.precent description:@"sx" textColor:[UIColor redColor] bgColor:[UIColor darkGrayColor] alpha:0.5 clips:YES];
    
    SXWaveView *animateView7 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    [self.view addSubview:animateView7];
    self.animateView7 = animateView7;
    [self.animateView7 setPrecent:self.precent description:@"sx" textColor:COLOR(56, 13, 49, 1) bgColor:COLOR(114, 111, 128, 1) alpha:0.5 clips:NO];
    
    SXWaveView *animateView8 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*2+SIDES, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    [self.view addSubview:animateView8];
    self.animateView8 = animateView8;
    [self.animateView8 setPrecent:self.precent description:@"sx" textColor:COLOR(151, 173, 172, 1) bgColor:COLOR(255, 94, 72, 1) alpha:1 clips:YES];
    
    SXWaveView *animateView9 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN*3+2*SIDES, 100+MARGIN*3+SIDES*2,SIDES, SIDES)];
    [self.view addSubview:animateView9];
    self.animateView9 = animateView9;
    [self.animateView9 setPrecent:self.precent description:@"sx" textColor:COLOR(255, 222, 0, 1) bgColor:COLOR(0, 90, 117, 1) alpha:0.2 clips:NO];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.animateView1 addAnimateWithType:0];
    [self.animateView2 addAnimateWithType:0];
    [self.animateView3 addAnimateWithType:0];
    [self.animateView4 addAnimateWithType:1];
    [self.animateView5 addAnimateWithType:1];
    [self.animateView6 addAnimateWithType:1];
    [self.animateView7 addAnimateWithType:2];
    [self.animateView8 addAnimateWithType:2];
    [self.animateView9 addAnimateWithType:2];
    NSLog(@"viewWillAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

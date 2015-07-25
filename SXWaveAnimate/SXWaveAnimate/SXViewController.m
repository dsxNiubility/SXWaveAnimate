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
@interface SXViewController ()

@property(nonatomic,strong)SXWaveView *animateView1;

@end

@implementation SXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    SXWaveView *animateView1 = [SXWaveView view];
    [self.view addSubview:animateView1];
    self.animateView1 = animateView1;
    animateView1.precent = self.precent;
    animateView1.frame = CGRectMake(0, 64,SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.animateView1 addAnimateWithType:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SXHalfWaveView.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/28.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXHalfWaveView.h"
#import "SXWaveView.h"

@interface SXHalfWaveView ()

@property(nonatomic,strong)SXWaveView *waveView;

@end
@implementation SXHalfWaveView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        CGRect subFrame = frame;
        subFrame.size.width = subFrame.size.width * 2;
        subFrame.origin.x = -self.width;
        subFrame.origin.y = 0;
        SXWaveView *waveView = [[SXWaveView alloc]initWithFrame:subFrame];
        self.waveView = waveView;
        waveView.backgroundColor = [UIColor orangeColor];
        [self addSubview:waveView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha{
    [self.waveView setPrecent:precent description:description textColor:tcolor bgColor:bColor alpha:alpha clips:YES];
    self.waveView.half = YES;
}

/** 参数值：0-正常 1-从高而降 2-先升再降*/
- (void)addAnimateWithType:(int)type{
    [self.waveView addAnimateWithType:type];
}

@end

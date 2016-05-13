//
//  SXWaterBackground.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 16/5/1.
//  Copyright © 2016年 Sankuai. All rights reserved.
//

#import "SXWaterBackground.h"
#import "UIColor+Separate.h"

#define kBGWidth self.frame.size.width
#define kBGHeight self.frame.size.height
#define kBGMargin (kBGWidth/38)
#define kBGTop (kBGWidth/5.75*(-1))

@interface SXWaterBackground ()

@property(nonatomic,strong)SXWaterBackgroundSub *v1;
@property(nonatomic,strong)SXWaterBackgroundSub *v2;
@property(nonatomic,strong)SXWaterBackgroundSub *v3;

@end
@implementation SXWaterBackground

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.v1 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0, kBGTop, kBGWidth/3, kBGHeight)];
        self.v2 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + kBGWidth/3 -1, kBGTop, kBGWidth/3, kBGHeight)];
        self.v3 = [[SXWaterBackgroundSub alloc]initWithFrame:CGRectMake(0 + kBGWidth/3*2 -2, kBGTop, kBGWidth/3, kBGHeight)];
        [self addSubview:_v1];
        [self addSubview:_v2];
        [self addSubview:_v3];
    }
    return self;
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    self.v1.subBgColor = bgColor;
    self.v2.subBgColor = bgColor;
    self.v3.subBgColor = bgColor;
}

- (void)setWaterColor:(UIColor *)waterColor
{
    _waterColor = waterColor;
    self.v1.subWaterColor = waterColor;
    self.v2.subWaterColor = waterColor;
    self.v3.subWaterColor = waterColor;
}

@end

@implementation SXWaterBackgroundSub

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context3 = UIGraphicsGetCurrentContext();
    CGContextAddRect(context3, self.bounds);
    [self.subBgColor set];
    CGContextFillPath(context3);
    
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context2, 0, kBGWidth * 0.5 + kBGMargin);
    CGContextAddCurveToPoint(context2,kBGWidth * (2 / 8.0) + kBGMargin,kBGWidth * (2.5 / 6.0) -kBGMargin,kBGWidth * (2 / 8.0) + kBGMargin,kBGWidth * (3.5 / 6.0) + kBGMargin,kBGWidth*(1 / 2.0),kBGWidth * (1 / 2.0) + kBGMargin);
    CGContextAddCurveToPoint(context2,kBGWidth * (6 / 8.0) + kBGMargin,kBGWidth * (2.5 / 6.0) -kBGMargin, kBGWidth*(6/8.0)+kBGMargin, kBGWidth*(3.5/6.0)+kBGMargin, kBGWidth*(1), kBGWidth * (1 / 2.0) + kBGMargin);
    CGContextAddLineToPoint(context2, kBGWidth, kBGWidth);
    CGContextAddLineToPoint(context2, 0, kBGWidth);
    CGContextAddLineToPoint(context2, 0, kBGWidth+kBGMargin);
    [self.subWaterColor setFill];
    CGContextFillPath(context2);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, kBGWidth * 0.5);
    CGContextAddCurveToPoint(context,kBGWidth * (2 / 8.0), kBGWidth * (2.5 / 6.0), kBGWidth * (2 / 8.0), kBGWidth * (3.5 / 6.0), kBGWidth * (1 / 2.0), kBGWidth * (1 / 2.0));
    CGContextAddCurveToPoint(context,kBGWidth * (6 / 8.0), kBGWidth * (2.5 / 6.0), kBGWidth * (6/ 8.0), kBGWidth * (3.5 / 6.0), kBGWidth * (1), kBGWidth * (1/2.0));
    CGContextAddLineToPoint(context, kBGWidth, kBGWidth);
    CGContextAddLineToPoint(context, 0, kBGWidth);
    CGContextAddLineToPoint(context, 0, kBGWidth*0.5);
    [[UIColor colorWithRed:self.subWaterColor.red green:self.subWaterColor.green blue:self.subWaterColor.blue alpha:0.3] setFill];
    CGContextFillPath(context);
    
    CGContextRef context4 = UIGraphicsGetCurrentContext();
    CGContextAddRect(context4, CGRectMake(0, kBGWidth, kBGWidth, kBGWidth));
    [self.subWaterColor set];
    CGContextFillPath(context4);
}

@end

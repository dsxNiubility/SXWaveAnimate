//
//  SXWaveView.m
//  SXWaveAnimate
//
//  Created by dongshangxian on 15/7/23.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "SXWaveView.h"
#import "SXWaterBackground.h"

#define W                       self.bounds.size.width
#define ItTop                   self.bigImg.top
#define ItLeft                  self.bigImg.left
#define kBigImgTopMargin        -20
#define kWaterAnimateDuration   4.0
#define completionWork          completion:^(BOOL finished) { if (self.endless) { acallBack(self.bigImg.layer.position.x); } if(self.timer) { [self.timer invalidate]; } }


@interface SXWaveView ()

@property (nonatomic,strong) SXWaterBackground *bigImg;
@property(nonatomic,assign)CGRect rect;
@property(nonatomic,assign)BOOL clips;
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIImageView *rotateImg;
@property (weak, nonatomic) UILabel *avgScoreLbl;
@property (weak, nonatomic) UILabel *descriptionLbl;
@property(nonatomic,strong)UIView *waterBackground;
@property(nonatomic,assign)CGFloat updatingNumber;
@property(nonatomic,assign)CGFloat tempNum;
@property(nonatomic,strong)NSTimer *timer;

@end
@implementation SXWaveView

#pragma mark -
#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        NSLog(@"%f",frame.size.width);
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:bgView];
        bgView.top = 0;
        bgView.left = 0;
        
        UIImageView *rotateImg = [[UIImageView alloc]initWithFrame:frame];
        rotateImg.contentMode = UIViewContentModeScaleAspectFit;
        rotateImg.image = [UIImage imageNamed:@"fb_rotation.png"];
        UIView * leftView = [[UIView alloc]init];

        [bgView addSubview:leftView];
        leftView.width = bgView.width - W/12.5;
        leftView.height = bgView.height - W/12.5;
        leftView.centerx = bgView.centerx;
        leftView.centery = bgView.centery;
        
        leftView.top = W/25;
        [bgView addSubview:rotateImg];
        rotateImg.top = 0;
        rotateImg.left = 0;
        
        UILabel *avgScoreLbl = [[UILabel alloc]init];
        avgScoreLbl.width = W / 1.5;
        avgScoreLbl.height = W / 4;
        avgScoreLbl.centerx = rotateImg.centerx;
        avgScoreLbl.centery = rotateImg.centery;
        avgScoreLbl.font = [UIFont fontWithName:@"DIN Alternate" size:30*W/125];
        avgScoreLbl.text = @"56%";
        avgScoreLbl.textAlignment = NSTextAlignmentCenter;
        
        UILabel *descriptionLbl = [[UILabel alloc]init];
        descriptionLbl.width = W / 2;
        descriptionLbl.height = W/6;
        descriptionLbl.centerx = rotateImg.centerx;
        descriptionLbl.centery = rotateImg.centery + 25*W/125;
        descriptionLbl.font = [UIFont systemFontOfSize:13*W/125];
        descriptionLbl.text = @"总评分";
        descriptionLbl.textAlignment = NSTextAlignmentCenter;
        
        [bgView addSubview:avgScoreLbl];
        [bgView addSubview:descriptionLbl];
        
        self.leftView = leftView;
        self.avgScoreLbl = avgScoreLbl;
        self.descriptionLbl = descriptionLbl;
        self.rotateImg = rotateImg;

        self.bigImg  = [[SXWaterBackground alloc]initWithFrame:CGRectMake(-5*W, W, 6*W, 3*W)];
        [self.leftView addSubview:self.bigImg];
        
        self.backgroundColor = [UIColor colorWithRed:42/255.0 green:178/255.0 blue:163/255.0 alpha:1];
        self.leftView.layer.cornerRadius = self.leftView.bounds.size.width/2.0;
        self.leftView.clipsToBounds = YES;
        
        self.alpha = 1.0;
        self.bgColor = [UIColor blackColor];
        self.waterColor = [UIColor whiteColor];
        self.textColor = [UIColor redColor];
        self.type = 0;
        self.endless = NO;
        self.descriptionTxt = @"SXWaterWave";
        self.precent = 0;
        self.updatingNumber = 0;
        self.tempNum = 0;
        self.updating = NO;
        
    }
    return self;
}

- (void)updateNumber
{
    if (self.type == 0) {
        self.updatingNumber = self.updatingNumber + self.precent/40.0;
    }else if (self.type == 1){
        self.tempNum += (100 - self.precent)/40;
        self.updatingNumber = 100 - self.tempNum;
    }
}

- (void)setUpdatingNumber:(CGFloat)updatingNumber
{
    _updatingNumber = updatingNumber;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%.1f%%",updatingNumber];
}

#pragma mark -
#pragma mark 赋值方法
- (void)setPrecent:(CGFloat)precent description:(NSString *)description
{
    [self setPrecent:precent];
    [self setDescriptionTxt:description];
}

- (void)setPrecent:(CGFloat)precent description:(NSString *)description textColor:(UIColor *)tcolor{
    [self setPrecent:precent description:description];
    [self setTextColor:tcolor];
}

- (void)setAlpha:(CGFloat)alpha clips:(BOOL)clips endless:(BOOL)endless{
    [self setAlpha:alpha];
    [self setClips:clips];
    [self setEndless:endless];
}

- (void)setTextColor:(UIColor *)tcolor bgColor:(UIColor *)bColor waterColor:(UIColor *)wColor{
    [self setTextColor:tcolor];
    [self setBgColor:bColor];
    [self setWaterColor:wColor];
}

- (void)setPrecent:(CGFloat)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha
{
    [self setAlpha:alpha];
    [self setTextColor:tcolor];
    [self setPrecent:precent];
}
- (void)setPrecent:(CGFloat)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips{
    [self setAlpha:alpha];
    [self setPrecent:precent];
    [self setClips:clips];
    [self setDescriptionTxt:description];
    [self setTextColor:tcolor];
    [self setBgColor:bColor];
}

- (void)setClips:(BOOL)clips
{
    _clips = clips;
    if (_clips == YES) {
        self.layer.cornerRadius = self.width/2;
        self.clipsToBounds = YES;
    }
}

- (void)setAlpha:(CGFloat)alpha{
    _alpha = alpha;
    self.bigImg.alpha = _alpha;
}

- (void)setPrecent:(CGFloat)precent{
    _precent = precent;
    self.avgScoreLbl.text = [NSString stringWithFormat:@"%.1f%%",precent];
}

- (void)setWaterColor:(UIColor *)waterColor
{
    _waterColor = waterColor;
    if (waterColor) {
        self.bigImg.waterColor = waterColor;
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    if (textColor) {
        self.avgScoreLbl.textColor = _textColor;
        self.descriptionLbl.textColor = _textColor;
    }
}

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    if (bgColor) {
        self.backgroundColor = _bgColor;
        self.bigImg.bgColor = bgColor;
    }
}

- (void)setDescriptionTxt:(NSString *)descriptionTxt{
    _descriptionTxt = descriptionTxt;
    if(descriptionTxt){
        self.descriptionLbl.text = _descriptionTxt;
    }
}

- (void)setHalf:(BOOL)half{
    _half = half;
    if (_half) {
        self.avgScoreLbl.centerx = self.width*0.72;
        self.avgScoreLbl.font = [UIFont fontWithName:@"DIN Alternate" size:30*W/180];
        self.descriptionLbl.centerx = self.width*0.72;
    }
}

#pragma mark -
#pragma mark 动画设置
NSString * viewRotationKey = @"rotationAnimation";
NSString * viewMoveKey = @"waveMoveAnimation";

- (void)addAnimateWithType:(int)type
{
    self.type = type;
    CABasicAnimation * transformRoate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformRoate.byValue = [NSNumber numberWithDouble:(2 * M_PI)];
    transformRoate.duration = kWaterAnimateDuration/2;
    transformRoate.repeatCount = self.isEndless == YES ? MAXFLOAT : 2;
    [self.rotateImg.layer addAnimation:transformRoate forKey:viewRotationKey];
    
    __weak __typeof(&*self)weakSelf = self;
    void(^acallBack)(CGFloat start) = ^(CGFloat start) {
        CAKeyframeAnimation * moveAction = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        moveAction.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-weakSelf.frame.size.width],[NSNumber numberWithFloat:start],nil];
        moveAction.duration = 4;
        // moveAction.autoreverses = YES;
        moveAction.repeatCount = MAXFLOAT;
        [weakSelf.bigImg.layer addAnimation:moveAction forKey:viewMoveKey];
    };

    if(self.updating){
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateNumber) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    if (type == 0)
    {
        [UIView animateWithDuration:kWaterAnimateDuration animations:^{
            ItLeft = 0;
            ItTop = W - ((_precent/100.0) * W);
            if (_precent == 100) {
                ItTop = kBigImgTopMargin;
            }
        } completionWork];
    }
    else if (type == 1)
    {
        ItTop = kBigImgTopMargin;
        ItLeft = -5*W;
        [UIView animateWithDuration:kWaterAnimateDuration animations:^{
            ItLeft = 0;
            ItTop = W - ((_precent/100.0) * W);
            if (_precent == 100) {
                ItTop = kBigImgTopMargin;
            }
        }completionWork];
    }
    else if (type == 2)
    {
        [UIView animateWithDuration:kWaterAnimateDuration/2 animations:^{
            ItTop = kBigImgTopMargin;
            ItLeft = -3*W;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:kWaterAnimateDuration/2 animations:^{
                ItLeft = 0;
                ItTop = W - ((_precent/100.0) * W);
                if (_precent == 100) {
                    ItTop = kBigImgTopMargin;
                }
            }completionWork];
        }];
    }
}

-(void)dealloc{
    [self.bigImg.layer removeAnimationForKey:viewRotationKey];
    [self.bigImg.layer removeAnimationForKey:viewMoveKey];
    [self.timer invalidate];
}

@end

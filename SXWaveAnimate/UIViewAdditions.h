//
//  UIViewAdditions.h
//  SXWaveAnimate
//
//  Created by dsx on 12-2-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView(Frame)

@property (nonatomic,assign)CGFloat top;
@property (nonatomic,assign)CGFloat bottom;
@property (nonatomic,assign)CGFloat left;
@property (nonatomic,assign)CGFloat right;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat centerx;
@property (nonatomic,assign)CGFloat centery;
@end



@interface UIView(ViewHiarachy)

@property (nonatomic,readonly)UIViewController *viewController;

- (void)removeAllSubviews;
@end



@interface UIView (gesture)

- (void)addTapAction:(SEL)tapAction target:(id)target;
@end

@interface UIView (sepLine)
+(UIView*) sepLineWithRect:(CGRect)rect;
+(UIView*) twoLayerSepLineWithRect:(CGRect)rect;
@end
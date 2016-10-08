//
//  TGView.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGView.h"

@implementation TGView

+ (TGView *)initWithFrame:(CGRect)frame superView:(UIView *)superView{
    TGView *view = [[TGView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor clearColor];
    [superView addSubview:view];
    return view;
}

+ (TGView *)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView{
    TGView *view = [[TGView alloc] initWithFrame:frame];
    [superView addSubview:view];
    if (backgroundColor != nil) {
        view.backgroundColor = backgroundColor;
    }else{
        view.backgroundColor = [UIColor clearColor];
    }
    return view;
}

- (void)setFrame:(CGRect)frame superView:(UIView *)superView{
    self.frame = frame;
    [superView addSubview:self];
}

- (void)addBorderWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    if (borderColor == nil) {
        self.layer.borderColor = [UIColor clearColor].CGColor;
    }else{
        self.layer.borderColor = borderColor.CGColor;
    }
    
    self.layer.borderWidth = 1;
}

- (void)addSubviews{
    
}

#pragma mark -- 计算view高度
+ (CGFloat)viewHeight{
    return 0;
}

#pragma mark -- 计算view高度
//+ (CGFloat)viewHeightWithModel:(MMModel *)model{
//    return 0;
//}


@end

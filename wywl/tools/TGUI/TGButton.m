//
//  TGButton.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGButton.h"

@implementation TGButton

#pragma mark - 按钮
+ (TGButton *)initWithFrame:(CGRect)frame superView:(UIView *)superView{
    TGButton *button = [TGButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:nil forState:UIControlStateNormal];
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    [superView addSubview:button];
    return button;
}
#pragma mark - 文字按钮
+ (TGButton *)initTitleBtnWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView{
    TGButton *button = [TGButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backgroundColor == nil) {
        button.backgroundColor = [UIColor clearColor];
    }else{
        button.backgroundColor = backgroundColor;
    }
    if (!EMPTY_STRING(title)) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor == nil) {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (titleFont == nil) {
        button.titleLabel.font = FONTSIZE14;
    }else{
        button.titleLabel.font = titleFont;
    }
    
    [superView addSubview:button];
    return button;
}
#pragma mark - 图片按钮
+ (TGButton *)initImageBtnWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage superView:(UIView *)superView{
    TGButton *button = [TGButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backgroundImage != nil) {
        [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        [button setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
    }
    [button setBackgroundColor:[UIColor clearColor]];
    [superView addSubview:button];
    return button;
}

#pragma mark -- 图片按钮
+ (TGButton *)initImageBtnWithFrame:(CGRect)frame backgroundImageStr:(NSString *)backgroundImageStr superView:(UIView *)superView{
    UIImage *image = [UIImage imageNamed:backgroundImageStr];
    return [self initImageBtnWithFrame:frame backgroundImage:image superView:superView];
}

#pragma mark - 设置边框
- (void)addBorderWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor{
    if (radius > 0) {
        self.layer.cornerRadius = radius;
    }
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1;
}


@end

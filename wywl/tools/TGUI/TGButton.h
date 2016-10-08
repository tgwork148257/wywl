//
//  TGButton.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGButton : UIButton

/***** ----按钮
 * frame:               按钮的位置大小
 * superView:           按钮的父视图
 *****/
+ (TGButton *)initWithFrame:(CGRect)frame superView:(UIView *)superView;


/***** ----文字按钮
 * frame:               按钮的位置大小
 * title:               按钮的标题
 * titleColor:          按钮标题的颜色
 * titleFont:           按钮标题的字号
 * backgroundColor:     按钮的背景色
 * superView:           按钮的父视图
 *****/
+ (TGButton *)initTitleBtnWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView;


/***** ----图片按钮
 * frame:               按钮的位置大小
 * backgroundImage:     按钮的背景图片
 * superView:           按钮的父视图
 *****/
+ (TGButton *)initImageBtnWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage superView:(UIView *)superView;


/***** ----图片按钮
 * frame:               按钮的位置大小
 * backgroundImageStr:  按钮的背景图片
 * superView:           按钮的父视图
 *****/
+ (TGButton *)initImageBtnWithFrame:(CGRect)frame backgroundImageStr:(NSString *)backgroundImageStr superView:(UIView *)superView;


/*****  ----增加边框
 * radius:              圆角角度
 * borderColor:         边框颜色
 *****/
- (void)addBorderWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor;


@end

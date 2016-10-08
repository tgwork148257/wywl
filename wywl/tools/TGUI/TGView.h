//
//  TGView.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGView : UIView

/***** ---- 通用View   类方法
 * frame:               位置大小
 * superView:           父视图
 *****/
+ (TGView *)initWithFrame:(CGRect)frame superView:(UIView *)superView;

/***** ---- 通用View   类方法
 * frame:               位置大小
 *backgroundColor:      背景色
 * superView:           父视图
 *****/
+ (TGView *)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView;


/***** ---- 通用View     实例方法
 * frame:               位置大小
 * superView:           父视图
 *****/
- (void)setFrame:(CGRect)frame superView:(UIView *)superView;


/***** ---- 增加边框和圆角
 * radius:              圆角
 * borderColor:         边框颜色
 *****/
- (void)addBorderWithRadius:(CGFloat)radius borderColor:(UIColor *)borderColor;

/***** ---- 添加子视图
 *****/
- (void)addSubviews;

/***** ---- 计算view高度
 *****/
+ (CGFloat)viewHeight;

/***** ---- 计算view高度
 *****/
//+ (CGFloat)viewHeightWithModel:(MMModel *)model;


@end

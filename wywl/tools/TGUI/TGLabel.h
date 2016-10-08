//
//  TGLabel.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGLabel : UILabel

/***** ----文字标签
 * frame:               标签的位置大小
 * text:                标签的文本
 * textColor:           标签的文本颜色
 * textFont:            标签的文本字号
 * textAlignment:       标签的文本对齐方式
 * superView:           标签的父视图
 *****/
+ (TGLabel *)initWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView;


/***** ----单行文字标签，高度和宽度自动计算
 * x:                   起始x
 * y:                   起始y
 * text:                标签的文本
 * textColor:           标签的文本颜色
 * textFont:            标签的文本字号
 * superView:           标签的父视图
 *****/
+ (TGLabel *)initWithX:(CGFloat)x y:(CGFloat)y text:(NSString *)text color:(UIColor *)color font:(UIFont *)font  superView:(UIView *)superView;


@end

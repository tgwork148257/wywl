//
//  TGLabel.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGLabel.h"

@implementation TGLabel

+ (TGLabel *)initWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment superView:(UIView *)superView{
    TGLabel *label = [[TGLabel alloc] init];
    label.frame = frame;
    if (superView != nil) {
        [superView addSubview:label];
    }
    label.backgroundColor = [UIColor clearColor];
    if (!EMPTY_STRING(text)) {
        label.text = text;
    }else{
        label.text = @"";
    }
    
    if (textColor == nil) {
        label.textColor = [UIColor blackColor];
    }else{
        label.textColor = textColor;
    }
    if (textFont == nil) {
        label.font = FONTSIZE14;
    }else{
        label.font = textFont;
    }
    
    
    label.textAlignment = textAlignment;
    return label;
}

+ (TGLabel *)initWithX:(CGFloat)x y:(CGFloat)y text:(NSString *)text color:(UIColor *)color font:(UIFont *)font  superView:(UIView *)superView{
    TGLabel *label = [[TGLabel alloc] init];
    
    if (!EMPTY_STRING(text)) {
        if (font == nil) {
            font = FONTSIZE14;
        }
        if (color == nil) {
            color = [UIColor blackColor];
        }
        
        CGRect rect = [TGManager rectWithString:text attrDic:@{NSFontAttributeName: font} size:CGSizeMake(DEVICE_W, DEVICE_H)];
        label.frame = CGRectMake(x, y, rect.size.width, rect.size.height);
        label.text = text;
    }
    label.font = font;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentCenter;
    
    
    if (superView != nil) {
        [superView addSubview:label];
    }
    return label;
}


@end

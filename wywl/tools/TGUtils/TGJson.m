//
//  TGJson.m
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGJson.h"

@implementation TGJson
#pragma mark -- 给字符串类型的字段赋值
+(NSString *)JsonStr:(id)value{
    if (value == nil || value == [NSNull null]) {
        return @"";
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    return @"";
}

#pragma mark -- 给NSInteger类型的字段赋值
+(NSInteger)JsonInteger:(id)value{
    return [[self JsonNum:value] integerValue];
}

#pragma mark -- 给Int类型的字段赋值
+(int)JsonInt:(id)value{
    return [[self JsonNum:value] intValue];
}

#pragma mark -- 给Float类型的字段赋值
+(float)JsonFloat:(id)value{
    return [[self JsonNum:value] floatValue];
}

#pragma mark -- 给long类型的字段赋值
+(long)JsonLong:(id)value{
    return [[self JsonNum:value] longValue];
}

#pragma mark -- private
+(NSNumber *)JsonNum:(id)value{
    if (value == nil || value == [NSNull null]) {
        return @(0);
    }else{
        return value;
    }
    //    if ([value isKindOfClass:[NSNumber class]]) {
    //        return value;
    //    }
    //    if ([value isKindOfClass:[NSString class]]) {
    //        return @(0);
    //    }
    //    return @(0);
}

+ (void)set:(id)value for:(id)target{
    if ([self isTypeEqual:value :target]) {
        value = target;
    }else{
        if ([self isNumberType:value]) {
            value = 0;
        }else if([self isStringType:value]){
            value = nil;
        }
    }
}

+ (BOOL)isTypeEqual:(id)varValue1 :(id)varValue2{
    if ([self isNumberType:varValue1] && [self isNumberType:varValue2]) {
        return YES;
    }else if([self isStringType:varValue1] && [self isStringType:varValue2]){
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)isStringType:(id)varValue{
    return [varValue isKindOfClass:[NSString class]];
}

+ (BOOL)isNumberType:(id)varValue{
    return [varValue isKindOfClass:[NSNumber class]];
}

@end

//
//  TGJson.h
//  SH12321
//
//  Created by Tommy on 6/12/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGJson : NSObject
//+ (void)set:(id)value for:(id)target;
//
//+ (void)NSIntegerJsonDic:(NSDictionary *)dic key:(NSString *)key;

//Json类型安全判断,根据字段的类型,把json获取的值,赋值给相应的字段

+(NSInteger)JsonInteger:(id)value;

+(NSString *)JsonStr:(id)value;

+(int)JsonInt:(id)value;

+(float)JsonFloat:(id)value;

+(long)JsonLong:(id)value;

@end

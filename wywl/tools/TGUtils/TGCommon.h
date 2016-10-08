//
//  TGCommon.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef TGCommon_h
#define TGCommon_h


#pragma mark ----- 位置,长度宽度相关
//*************************位置,长度宽度相关*************************//

#define DEVICE_F [UIScreen mainScreen].bounds               //当前设备frame
#define DEVICE_W [UIScreen mainScreen].bounds.size.width    //当前设备宽度
#define DEVICE_H [UIScreen mainScreen].bounds.size.height   //当前设备高度

#define L_R_EDGE 16.0F                      //左右通用边距
#define MIDDLE_W (DEVICE_W - (L_R_EDGE*2))  //去掉左右通用边距的宽度
#define ORIGIN_X 16.0F                      //通用X起点
#define ORIGIN_Y 64.0F                      //导航栏下面的Y起点，适配iOS view起点变化问题
#define TABBAR_H 44.0F                      //tabbar高度
#define TEMP_H   64.0F                      //用于动态计算view高度时的临时高度


#define SCALE_X (DEVICE_W / 375.0F)   //iPhoneX适配
#define SCALE_Y (DEVICE_H / 667.0F)   //iPhoneY适配

#define TEXT_SIZE  CGSizeMake(MIDDLE_W, MAXFLOAT)

//*****************************************************************//



#pragma mark ----- 字体颜色相关
//*************************字体颜色相关*************************//

//字体
#define FONTSIZE8  [UIFont systemFontOfSize:8.0F]
#define FONTSIZE9  [UIFont systemFontOfSize:9.0F]
#define FONTSIZE10 [UIFont systemFontOfSize:10.0F]
#define FONTSIZE11 [UIFont systemFontOfSize:11.0F]
#define FONTSIZE12 [UIFont systemFontOfSize:12.0F]
#define FONTSIZE13 [UIFont systemFontOfSize:13.0F]
#define FONTSIZE14 [UIFont systemFontOfSize:14.0F]
#define FONTSIZE15 [UIFont systemFontOfSize:15.0F]
#define FONTSIZE16 [UIFont systemFontOfSize:16.0F]
#define FONTSIZE17 [UIFont systemFontOfSize:17.0F]
#define FONTSIZE18 [UIFont systemFontOfSize:18.0F]
#define FONTSIZE20 [UIFont systemFontOfSize:20.0F]
#define FONTSIZE22 [UIFont systemFontOfSize:22.0F]
#define FONTSIZE24 [UIFont systemFontOfSize:24.0F]
#define FONTSIZE36 [UIFont systemFontOfSize:36.0F]

//字体高度
#define FONTHEIGHT8  [TGManager heightWithFont:FONTSIZE8]
#define FONTHEIGHT9  [TGManager heightWithFont:FONTSIZE9]
#define FONTHEIGHT10 [TGManager heightWithFont:FONTSIZE10]
#define FONTHEIGHT11 [TGManager heightWithFont:FONTSIZE11]
#define FONTHEIGHT12 [TGManager heightWithFont:FONTSIZE12]
#define FONTHEIGHT13 [TGManager heightWithFont:FONTSIZE13]
#define FONTHEIGHT14 [TGManager heightWithFont:FONTSIZE14]
#define FONTHEIGHT15 [TGManager heightWithFont:FONTSIZE15]
#define FONTHEIGHT16 [TGManager heightWithFont:FONTSIZE16]
#define FONTHEIGHT17 [TGManager heightWithFont:FONTSIZE17]
#define FONTHEIGHT18 [TGManager heightWithFont:FONTSIZE18]
#define FONTHEIGHT20 [TGManager heightWithFont:FONTSIZE20]
#define FONTHEIGHT22 [TGManager heightWithFont:FONTSIZE22]
#define FONTHEIGHT24 [TGManager heightWithFont:FONTSIZE24]
#define FONTHEIGHT36 [TGManager heightWithFont:FONTSIZE36]

//分割线颜色
#define C_LINE [UIColor colorWithRed:245.0/255.0F green:245.0/255.0F blue:245.0/255.0F alpha:1]

//系统颜色
#define C_RED               [UIColor redColor]
#define C_BLUE              [UIColor blueColor]
#define C_GREEN             [UIColor greenColor]
#define C_WHITE             [UIColor whiteColor]
#define C_BLACK             [UIColor blackColor]

#define nav_right_item_x        DEVICE_W - nav_item_width - 6
#define nav_left_item_x         2
#define nav_item_width          36
#define nav_item_height         36
#define nav_item_y              24



//************************************************************//



#pragma mark ----- 函数相关
//*************************函数相关*************************//

//判断字符串为空
#define EMPTY_STRING(string) \
([string isKindOfClass:[NSNull class]] || string == nil || [string isEqualToString:@""])

//判断数组是否为空
#define EMPTY_ARR(arr) \
(([arr isKindOfClass:[NSNull class]] || arr == nil || arr.count == 0 ) )
/* |||| (![arr isKindOfClass:[NSArray class]] || ![arr isKindOfClass:[NSMutableArray class]])*/


//判断字典是否为为空
#define EMPTY_DIC(dic) \
(([dic isKindOfClass:[NSNull class]] || dic == nil ))
/*|| (![dic isKindOfClass:[NSDictionary class]] || ![dic isKindOfClass:[NSMutableDictionary class]])*/


//NSInterToStr转换
#define IntegerToStr(integer) \
([NSString stringWithFormat:@"%ld",((long)integer)])

//设置字符串字体并转化为attributeString
#define StrToAttrStr(str, font) \
([[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName: font}]);

//主线程
#define main_queue dispatch_get_main_queue()

//网络请求线程
#define request_queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

//**********************************************************//




#pragma mark ----- 其他常量
//*************************其他常量*************************//

//********服务端请求相关*********//

//请求服务端最大时间
#define REQUEST_TIMEOUT     10

//登录用access token
#define ACCESS_TOKEN @"ffff"

//设备唯一标识符 device token
#define DEVICE_TOKEN [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//设备系统版本 device os version
#define DEVICE_OS_VERSION [[UIDevice currentDevice] systemVersion]

//设备当前应用版本 device app version
#define DEVICE_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//服务端请求版本key 和 value
#define SERVER_VERSION_KEY      @"VERSION"         //服务端接口版本key
#define SERVER_VERSION_VALUE    @"1.0"             //服务端接口版本value




//**********************************************************//

#pragma mark ----- 第三方平台信息
/*
 ************************
 *     第三方平台信息     *
 ************************
 */



#endif /* TGCommon_h */

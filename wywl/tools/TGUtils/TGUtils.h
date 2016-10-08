//
//  TGUtils.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^InfoBlock) ();


@class TGViewController;
@interface TGUtils : NSObject

/*
 *获取当前显示的viewController
 */
+ (TGViewController *)currentVCWithCurrentView:(UIView *)view;

/*
 *获取当前显示的NavigationController
 */
+ (UINavigationController *)currentNavWithView:(UIView *)view;

/*
 *提示label
 *
 */

+ (void)showInfo:(NSString *)showText view:(UIView *)view;

+ (void)showInfo:(NSString *)showText viewController:(UIViewController *)viewController;

+ (void)showInfo:(NSString *)showText show:(InfoBlock)showBlock  dismiss:(InfoBlock)dismissBlock viewController:(UIViewController *)viewController;



//评论中计算评论内容的左间距
+ (CGFloat)commentContentX:(CGFloat)contentW;



//压缩图片
+ (NSData *)compressImage:(UIImage *)image;


//日期相关
+ (NSString *)getWeekDays; //获取星期几

+ (NSString *)minuteOrHourConvertToStr:(NSInteger)minuteOrHour;
+ (NSString *)dayOrMonthConvertToStr:(NSInteger)dayOrMonth;

+ (NSInteger)currentDayWithDate:(NSDate *)date;

+ (NSInteger)currentMonthWithDate:(NSDate *)date;

+ (NSInteger)currentYearWithDate:(NSDate *)date;

+ (NSString *)currentDateStrWithDate:(NSDate *)date;

//判断日期是否在今天之前
+ (BOOL)isDateBeforeNow:(NSString *)targetDateStr;

//判断计划完成按钮是否可以点击
+ (BOOL)isCompletedBtnCanClick:(NSString *)targetDateStr;

//中英文计算字符长度
+ (NSInteger)countTextLength:(NSString *)str;

#pragma mark - 是否是全数字
+ (BOOL)isNumber:(NSString *)str;

//是否是电话号码
+ (BOOL)isPhoneNumber:(NSString *)str;

//去掉字符串的空格
+ (NSString *)removeStrSpace:(NSString *)str;

//判断Tableview 数组数据
+ (BOOL)isCorrectArr:(NSArray *)arr index:(NSInteger)index;

//识别字符串的网址并返回
+ (NSArray *)matchWebsiteOrTopicStr:(NSString *)sourceStr;

#pragma mark - 超链接字符串转换
+ (NSAttributedString *)attributedString:(NSArray *__autoreleasing *)outURLs
                               URLRanges:(NSArray *__autoreleasing *)outURLRanges
                              contentStr:(NSString *)contentStr
                                textFont:(UIFont *)font
                               textColor:(UIColor *)color;

#pragma mark -- token
+ (NSString *)getServerToken;
+ (void)saveServerToken:(NSString *)token;

#pragma mark - user toekn
+ (NSString *)getUserToken;
+ (void)saveUserToken:(NSDictionary *)tokenDic;

+ (BOOL)isUserLogin;


#pragma mark -图片转字符串
+ (NSString *)imageToBase64Str:(UIImage *) image;

#pragma mark - 字符串转图片
+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr;

#pragma mark -图片转二进制
+ (NSData *)imageToData:(UIImage *) image;


#pragma mark - version info
+ (NSString *)getVersion;
+ (void)saveVersion:(NSString *)versionStr;




@end

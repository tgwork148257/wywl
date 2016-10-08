//
//  TGManager.h
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 手机类型
typedef NS_ENUM(NSInteger, Phone_Model) {
    iPhone_4s,
    iPhone_5,
    iPhone_6,
    iPhone_6p,
    iPhone_other,
};

#pragma mark - 手机类型
typedef NS_ENUM(NSInteger, Network_State) {
    Network_No,
    Network_2G,
    Network_3G,
    Network_4G,
    Network_5G,
    Network_WIFI,
};


@interface TGManager : NSObject

/* 根据字符串或者RGB获取颜色 */
+ (UIColor *)colorWithString:(NSString *)colorString;    //获取颜色
+ (UIColor *)colorWithR:(float)red G:(float)green B:(float)blue; //获取颜色
+ (UIColor *)colorWithR:(float)red G:(float)green B:(float)blue alpha:(float)alpha; //获取颜色

/* 根据字号获取文字高度*/
+ (CGFloat)heightWithFont:(UIFont *)font;

//计算文字宽高
+ (CGRect)heightWithText:(NSString *)str attrDic:(NSDictionary *)attrisDic;
+ (CGRect)heightWithText:(NSString *)str attrDic:(NSDictionary *)attrisDic size:(CGSize )size;

+ (CGRect)heightWithAttrString:(NSAttributedString *)attrStr Dic:(NSDictionary *)attrisDic;
+ (CGRect)heightWithAttrString:(NSAttributedString *)attrStr Dic:(NSDictionary *)attrisDic size:(CGSize)size;

+ (CGRect)rectWithString:(NSString *)str attrDic:(NSDictionary *)attrisDic;
+ (CGRect)rectWithString:(NSString *)str attrDic:(NSDictionary *)attrisDic size:(CGSize)size;

+ (CGRect)rectWithAttrString:(NSAttributedString *)attrStr size:(CGSize)size;
+ (CGRect)rectWithAttrString:(NSAttributedString *)attrStr;
/* 颜色转Image */
+ (UIImage *)renderImageWithColor:(UIColor *)color;

/*根据时间戳判断当前时间和时间戳的差值 返回:"XX天(小时)前"*/
+ (NSString *)timeStr:(long)createTime;

/*获取用户手机类型*/
+ (Phone_Model)phone_Model;

/*获取网络状态*/
+(Network_State)netWorkState;

/*判断有没有网络*/
+ (BOOL)isConnectedNetwork;

/*判断是不是自己*/
+ (BOOL)isMyselfWithUID:(NSInteger)userID;

///*更新用户缓存用户信息*/
//+ (void)updateUserInfoWithUser:(UserSearchResultsModel *)user;
//
///*获取用户缓存信息*/
//+ (UserSearchResultsModel *)getUserCacheData;

/*判断用户是否登录*/
+ (BOOL)isUserLogin;

/*获取用户上传图片的URL(解决缓存现象)*/
+ (NSURL *)getUrlWithUserHeader:(NSString *)user_header;


/*添加阴影效果*/
+ (void)addShadowWithView:(UIView *)View color:(UIColor *)color opacity:(NSInteger)opacity radius:(NSInteger)radius size:(CGSize )size;


// 是否显示指引图
+ (BOOL)isShowGuideViewWithKey:(NSString *)key;
// 获取屏幕分辨率比率
+ (CGFloat)getScreenScale;

// 判断是否有网
+ (BOOL)connectedToNetwork;

@end

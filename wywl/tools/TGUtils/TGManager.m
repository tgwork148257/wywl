//
//  TGManager.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGManager.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <netdb.h>
#import <arpa/inet.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import <arpa/inet.h>


@implementation TGManager

#pragma mark - 颜色转换
+ (UIColor *)colorWithString:(NSString *)colorString{
    if (colorString.length < 6) {
        return nil;
    }
    unsigned int red,green,blue,alpha;
    NSRange range;
    range.length = 2;
    range.location = 0;
    
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&blue];
    if (colorString.length == 8) {
        range.location = 6;
        [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&alpha];
        return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:(alpha / 255.0f)];
    }else {
        return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
    }
    
}

+ (UIColor *)colorWithR:(float)red G:(float)green B:(float)blue {
    return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorWithR:(float)red G:(float)green B:(float)blue alpha:(float)alpha {
    return [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:alpha];
}

#pragma mark - 计算文字高度
//根据字号计算文字高度
+ (CGFloat)heightWithFont:(UIFont *)font {
    CGSize size = CGSizeMake(DEVICE_W, MAXFLOAT);
    NSDictionary *dic = @{NSFontAttributeName:font};
    NSString *countStr = @"计算";
    CGRect rect = [self heightWithText:countStr attrDic:dic size:size];
    return rect.size.height;
}

//计算文字宽高
+ (CGRect)heightWithText:(NSString *)str attrDic:(NSDictionary *)attrisDic {
    if (EMPTY_STRING(str)) {
        return CGRectZero;
    }
    CGSize size = CGSizeMake(MIDDLE_W, MAXFLOAT);
    return [self heightWithText:str attrDic:attrisDic size:size];
}

+ (CGRect)heightWithText:(NSString *)str attrDic:(NSDictionary *)attrisDic size:(CGSize )size {
    if (EMPTY_STRING(str)) {
        return CGRectZero;
    }
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attrisDic context:nil];
    return rect;
}

//根据特殊字符串计算文字高度
+ (CGRect)heightWithAttrString:(NSAttributedString *)attrStr Dic:(NSDictionary *)attrisDic {
    if (attrStr == nil || [attrStr isKindOfClass:[NSNull class]]) {
        return CGRectZero;
    }
    CGSize size = CGSizeMake(MIDDLE_W, MAXFLOAT);
    return [self heightWithAttrString:attrStr Dic:attrisDic size:size];
}

+ (CGRect)heightWithAttrString:(NSAttributedString *)attrStr Dic:(NSDictionary *)attrisDic size:(CGSize) size {
    if (attrStr == nil || [attrStr isKindOfClass:[NSNull class]]) {
        return CGRectZero;
    }
    CGRect rect = [attrStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine context:nil];
    return rect;
}

#pragma mark -- 普通字符串计算占用空间
+ (CGRect)rectWithString:(NSString *)str attrDic:(NSDictionary *)attrisDic{
    if (EMPTY_STRING(str)) {
        return CGRectZero;
    }
    if (attrisDic == nil) {
        attrisDic = @{NSFontAttributeName: FONTSIZE12};
    }
    CGSize size = CGSizeMake(MIDDLE_W, MAXFLOAT);
    return [self rectWithString:str attrDic:attrisDic size:size];
}

+ (CGRect)rectWithString:(NSString *)str attrDic:(NSDictionary *)attrisDic size:(CGSize)size{
    if (EMPTY_STRING(str)) {
        return CGRectZero;
    }
    if (attrisDic == nil) {
        attrisDic = @{NSFontAttributeName: FONTSIZE12};
    }
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attrisDic context:nil];
    return rect;
}

#pragma mark -- 属性字符串计算占用空间
+ (CGRect)rectWithAttrString:(NSAttributedString *)attrStr size:(CGSize)size{
    if (attrStr == nil || [attrStr isKindOfClass:[NSNull class]]) {
        return CGRectZero;
    }
    CGRect rect = [attrStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine context:nil];
    return rect;
}

+ (CGRect)rectWithAttrString:(NSAttributedString *)attrStr{
    if (attrStr == nil || [attrStr isKindOfClass:[NSNull class]]) {
        return CGRectZero;
    }
    CGSize size = CGSizeMake(MIDDLE_W, MAXFLOAT);
    return [self rectWithAttrString:attrStr size:size];
}


#pragma mark - 颜色转Image
+ (UIImage *)renderImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 时间转换
+ (NSString *)timeStr:(long)createTime {
    NSString *createTimeStr = nil;
    long nowT = time(NULL);
    nowT = (nowT - createTime);
    if (nowT >= 60) {
        nowT = nowT / 60;
        if (nowT >= 60) {
            nowT = nowT / 60;
            if (nowT >= 24) {
                nowT = nowT / 24;
                if (nowT >= 30) {
                    nowT = nowT / 30 ;
                    if (nowT >= 12) {
                        nowT  = nowT / 12;
                        createTimeStr =  [NSString stringWithFormat:@"%ld年前", nowT];
                    }else{
                        createTimeStr =  [NSString stringWithFormat:@"%ld月前", nowT];
                    }
                }else{
                    createTimeStr =  [NSString stringWithFormat:@"%ld天前", nowT];
                }
            }else{
                createTimeStr =  [NSString stringWithFormat:@"%ld小时前", nowT];
            }
        }else{
            createTimeStr =  [NSString stringWithFormat:@"%ld分钟前", nowT];
        }
    }else {
        if (nowT <= 30) {
            createTimeStr = @"刚刚";
        }else if (nowT >30) {
            createTimeStr = @"1分钟内";
        }
    }
    return createTimeStr;
}
#pragma mark - 获取手机型号
+ (Phone_Model)phone_Model {
    
    NSInteger w = (long)DEVICE_W;
    //    NSInteger h = (long)DEVICE_H;
    if (w == 414) {
        return iPhone_6p;
    }
    if (w == 375){
        return iPhone_6;
    }
    if (w == 320){
        return iPhone_5;
    }
    return iPhone_other;
    //    else if (DEVICE_H < 481){
    //        return iPhone_4s;
    //    }else {
    //        return iPhone_other;
    //    }
    //    if (DEVICE_H <= 568 && DEVICE_H > 480) {
    //        return iPhone_5s;
    //    }else if (DEVICE_H <= 667 && DEVICE_H > 568){
    //        return iPhone_6;
    //    }else if (DEVICE_H >= 736){
    //        return iPhone_6p;
    //    }else if (DEVICE_H < 481){
    //        return iPhone_4s;
    //    }else {
    //        return iPhone_other;
    //    }
}

#pragma mark - 获取网络状态
+(Network_State)netWorkState {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    Network_State state = Network_No;
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            
            switch (netType) {
                case 0:
                    state = Network_No;
                    break;
                case 1:
                    state = Network_2G;
                    break;
                case 2:
                    state = Network_3G;
                    break;
                case 3:
                    state = Network_4G;
                    break;
                case 5:
                    state = Network_WIFI;
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}

#pragma mark - 判断有没有网络
+ (BOOL)isConnectedNetwork {
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

//#pragma mark - 更新用户缓存用户信息
//+ (void)updateUserInfoWithUser:(UserSearchResultsModel *)user {
//    NSArray *arrayCoding = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [arrayCoding lastObject];
//    NSString *filePath = [path stringByAppendingPathComponent:USERDATA];
//    [NSKeyedArchiver archiveRootObject:user toFile:filePath];
//}
//
//#pragma mark - 获取用户缓存信息
//+ (UserSearchResultsModel *)getUserCacheData {
//    UserSearchResultsModel *user = [[UserSearchResultsModel alloc] init];
//    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [array lastObject];
//    NSString *filePath = [path stringByAppendingPathComponent:USERDATA];
//    user = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//    return user;
//}
#pragma mark - 判断用户是否登录
//+ (BOOL)isUserLogin {
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *isLogin = [userDefaults objectForKey:ACCESSTOKEN_KEY];
//    if (EMPTY_STRING(isLogin)) {
//        return NO;
//    }else {
//        return YES;
//    }
//}

#pragma mark - 获取用户上传图片的URL(解决缓存现象)
+ (NSURL *)getUrlWithUserHeader:(NSString *)user_header {
    int headerWH = (arc4random() % 1000000);
    int headerQ = (arc4random() % 10) + 70;
    NSString *headerSuffix = [NSString stringWithFormat:@"?imageView2/1/w/%d/h/%d/q/%d",headerWH ,headerWH, headerQ];
    
    NSString *imageString = [user_header stringByAppendingString:headerSuffix];
    NSURL *url = [NSURL URLWithString:imageString];
    return url;
}




// 添加阴影效果
+ (void)addShadowWithView:(UIView *)View color:(UIColor *)color opacity:(NSInteger)opacity radius:(NSInteger)radius size:(CGSize )size {
    View.layer.shadowOpacity = opacity;
    View.layer.shadowRadius = radius;
    View.layer.shadowColor = color.CGColor;
    View.layer.shadowOffset = size;
}



///*判断是不是自己*/
//+ (BOOL)isMyselfWithUID:(NSInteger)userID{
//    
//    UserSearchResultsModel *model = [MMCommonManager getUserCacheData];
//    
//    return (model.user_id == userID);
//}


//+ (CGFloat)getScreenScale {
//    return SCALE_SCREEN;
//}

+ (BOOL)connectedToNetwork {
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}


@end

//
//  TGUtils.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGUtils.h"

@implementation TGUtils

+ (TGViewController *)currentVCWithCurrentView:(UIView *)view{
    
    TGViewController *result = nil;
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (TGViewController *)nextResponder;
        }
    }
    
    return result;
}

/*
 *获取当前显示的NavigationController
 */
+ (UINavigationController *)currentNavWithView:(UIView *)view{
    return [self currentVCWithCurrentView:view].navigationController;
}

#pragma mark - 显示提示信息
+ (void)showInfo:(NSString *)showText view:(UIView *)view{
    [self showInfo:showText viewController:[self currentVCWithCurrentView:view]];
}


+ (void)showInfo:(NSString *)showText viewController:(UIViewController *)viewController{
    [self showInfo:showText show:nil dismiss:nil viewController:viewController];
}


+ (void)showInfo:(NSString *)showText show:(InfoBlock)showBlock  dismiss:(InfoBlock)dismissBlock viewController:(UIViewController *)viewController{
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if (view.tag == 1044323) {
            [view removeFromSuperview];
            break;
        }
    }
    
    // 提示背景
    UIView *infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DEVICE_W, 0)];
    infoView.backgroundColor = [UIColor colorWithRed:186/255.0f green:186/255.0f blue:186/255.0f alpha:0.8];
    infoView.tag = 1044323;
    infoView.layer.masksToBounds = YES;
    
    [[UIApplication sharedApplication].keyWindow addSubview:infoView];
    float infoViewHeight = 0;
    float infoViewY = 0;
    float infoLabelY = 0;
    float infoLabeHeight = 0;
    
    if (viewController.navigationController.navigationBar.hidden == YES) {
        infoViewY = 0;
        infoLabelY = 0;
        infoViewHeight = 40;
        infoLabeHeight = infoViewHeight + 5;
        showText = [NSString stringWithFormat:@"\n%@", showText];
    }else {
        infoViewY = 64;
        infoLabelY = 0;
        infoViewHeight = 30;
        infoLabeHeight = infoViewHeight;
        infoView.layer.cornerRadius = infoViewHeight / 2;
    }
    infoView.frame = CGRectMake(0, infoViewY, DEVICE_W, 0);
    if (viewController.navigationController.navigationBar.hidden == NO) {
        infoView.frame = CGRectMake(20, infoView.frame.origin.y, DEVICE_W - 40 , infoView.frame.size.height);
    }
    // 提示信息
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, infoLabelY, DEVICE_W, 0)];
    if (viewController.navigationController.navigationBar.hidden == NO) {
        infoLabel.frame = CGRectMake(0, infoLabel.frame.origin.y, DEVICE_W - 40 , infoLabel.frame.size.height);
    }
    infoLabel.text = @"美秘提示";
    infoLabel.backgroundColor = [UIColor clearColor];
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.font = [UIFont systemFontOfSize:12.0f];
    infoLabel.numberOfLines = 0;
    [infoView addSubview:infoLabel];
    
    
    [UIView animateWithDuration:0.3f animations:^{
        infoView.frame = CGRectMake(infoView.frame.origin.x, infoViewY, infoView.frame.size.width, infoViewHeight);
        infoLabel.frame = CGRectMake(infoLabel.frame.origin.x, infoLabelY, infoLabel.frame.size.width, infoLabeHeight);
        infoLabel.text = showText;
        if (showBlock) {
            showBlock();
        }
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3F delay:1.3F options:UIViewAnimationOptionTransitionNone animations:^{
            infoView.frame = CGRectMake(infoView.frame.origin.x, infoViewY, infoView.frame.size.width, 0);
            infoLabel.frame = CGRectMake(infoLabel.frame.origin.x, infoLabelY, infoLabel.frame.size.width, 0);
        } completion:^(BOOL finished) {
            if (dismissBlock) {
                dismissBlock();
            }
        }];
    }];
}

#pragma --  压缩图片
+ (NSData *)compressImage:(UIImage *)image{
    return UIImageJPEGRepresentation(image,0.4);  //压缩系数0.4
}


#pragma mark -- 日期相关
+ (NSString *)getWeekDays{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger week = [comps weekday];
    NSArray *weekArr = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    return weekArr[week - 1];
}

+ (NSString *)minuteOrHourConvertToStr:(NSInteger)minuteOrHour{
    return [self convertToStr:minuteOrHour];
}

+ (NSString *)dayOrMonthConvertToStr:(NSInteger)dayOrMonth{
    return [self convertToStr:dayOrMonth];
}

+ (NSString *)convertToStr:(NSInteger)number {
    NSString *str;
    if (number < 10) {
        str = [NSString stringWithFormat:@"0%ld",(long)number];
    }else{
        str = IntegerToStr(number);
    }
    return str;
}

+ (NSInteger)currentDayWithDate:(NSDate *)date{
    return [[self currentDateComponentWithData:date] day];
}

+ (NSInteger)currentMonthWithDate:(NSDate *)date{
    return [[self currentDateComponentWithData:date] month];
}

+ (NSInteger)currentYearWithDate:(NSDate *)date{
    return [[self currentDateComponentWithData:date] year];
}

+ (NSString *)currentDateStrWithDate:(NSDate *)date{
    NSString *year = IntegerToStr([self currentYearWithDate:date]);
    NSString *month = [self dayOrMonthConvertToStr:[self currentMonthWithDate:date]];
    NSString *day = [self dayOrMonthConvertToStr:[self currentDayWithDate:date]];
    return [[[[year stringByAppendingString:@"-"] stringByAppendingString:month] stringByAppendingString:@"-"] stringByAppendingString:day];
}

+ (NSDateComponents *)currentDateComponentWithData:(NSDate *)date{
    if (date == nil) {
        date = [NSDate date];
    }
    NSCalendar *currentCalender = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [currentCalender components:unitFlags fromDate:date];
    return dateComponent;
}

+ (BOOL)isDateBeforeNow:(NSString *)targetDateStr{
    NSInteger currentYear = [self currentYearWithDate:[NSDate date]];
    NSInteger currentMonth = [self currentMonthWithDate:[NSDate date]];
    NSInteger currentDay = [self currentDayWithDate:[NSDate date]];
    
    NSInteger targetYear = [[targetDateStr substringToIndex:4] integerValue];
    NSInteger targetMonth = [[[targetDateStr substringFromIndex:5] substringToIndex:2] integerValue];
    NSInteger targetDay = [[targetDateStr substringFromIndex:8] integerValue];
    BOOL isDateBeforeNow = NO;
    if ((currentYear > targetYear)) {
        isDateBeforeNow = YES;
    }else if (currentYear == targetYear){
        if (currentMonth > targetMonth) {
            isDateBeforeNow = YES;
        }else if (currentMonth == targetMonth){
            if (currentDay > targetDay) {
                isDateBeforeNow = YES;
            }else{
                isDateBeforeNow = NO;
            }
        }else{
            isDateBeforeNow = NO;
        }
    }else{
        isDateBeforeNow = NO;
    }
    return isDateBeforeNow;
}

#pragma mark -- 判断计划完成按钮是否可以点击
+ (BOOL)isCompletedBtnCanClick:(NSString *)targetDateStr{
    if (EMPTY_STRING(targetDateStr)) {
        return YES;
    }
    NSInteger currentYear = [self currentYearWithDate:[NSDate date]];
    NSInteger currentMonth = [self currentMonthWithDate:[NSDate date]];
    NSInteger currentDay = [self currentDayWithDate:[NSDate date]];
    
    NSInteger targetYear = [[targetDateStr substringToIndex:4] integerValue];
    NSInteger targetMonth = [[[targetDateStr substringFromIndex:5] substringToIndex:2] integerValue];
    NSInteger targetDay = [[targetDateStr substringFromIndex:8] integerValue];
    BOOL isCompletedBtnCanClick = NO;
    if ((currentYear > targetYear)) {
        isCompletedBtnCanClick = YES;
    }else if (currentYear == targetYear){
        if (currentMonth > targetMonth) {
            isCompletedBtnCanClick = YES;
        }else if (currentMonth == targetMonth){
            if (currentDay >= targetDay) {
                isCompletedBtnCanClick = YES;
            }else{
                isCompletedBtnCanClick = NO;
            }
        }else{
            isCompletedBtnCanClick = NO;
        }
    }else{
        isCompletedBtnCanClick = NO;
    }
    return isCompletedBtnCanClick;
}

#pragma mark - 中英文混合计算字符长度
+ (NSInteger)countTextLength:(NSString *)str{
    NSInteger number = 0;
    for (int i = 0; i < str.length; i++) {
        int a = [str characterAtIndex:i];
        if (a > 0x4E00 && a<0x9FFF) {
            number += 2;
        }else{
            number += 1;
        }
    }
    return number;
}

#pragma mark - 是否是全数字
+ (BOOL)isNumber:(NSString *)string{
    if (EMPTY_STRING(string)) {
        return NO;
    }
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - 去掉字符串首尾的空格
+ (NSString *)removeStrSpace:(NSString *)str{
    //    NSString * rangeStr = @" yangiqjun   -  123 ";
    //    str  = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //    return str;
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

#pragma mark - 判断Tableview 数组数据
+ (BOOL)isCorrectArr:(NSArray *)arr index:(NSInteger)index{
    if (!EMPTY_ARR(arr) && arr.count > index) {
        return YES;
    }else{
        return NO;
    }
}


#pragma mark - server toekn 
+ (NSString *)getServerToken{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:serverTokenKey];
    return token;
}


+ (void)saveServerToken:(NSDictionary *)tokenDic{
    NSString *token = [tokenDic objectForKey:serverTokenKey];
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:serverTokenKey];
}

#pragma mark - user toekn
+ (NSString *)getUserToken{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:userTokenKey];
    return token;
}


+ (void)saveUserToken:(NSDictionary *)tokenDic{
    NSString *token = [tokenDic objectForKey:userTokenKey];
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:userTokenKey];
}

+ (BOOL)isUserLogin{
    return !EMPTY_STRING([TGUtils getUserToken]);
}

#pragma mark -图片转字符串
+ (NSString *)imageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

#pragma mark - 字符串转图片
+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr
{
    NSData *decodedImageData = [[NSData alloc] initWithBase64Encoding:encodedImageStr];
    UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}

#pragma mark -图片转二进制
+ (NSData *)imageToData:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 0.5f);
    return data;
}


#pragma mark - version info
+ (NSString *)getVersion{
    NSString *versionStr = [[NSUserDefaults standardUserDefaults] objectForKey:versionKey];
    return versionStr;
}

+ (void)saveVersion:(NSString *)versionStr{
    [[NSUserDefaults standardUserDefaults] setObject:versionStr forKey:versionKey];
}









@end

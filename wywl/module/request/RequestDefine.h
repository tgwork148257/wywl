//
//  RequestDefine.h
//  wywl
//
//  Created by Tommy on 10/8/16.
//  Copyright © 2016 ys. All rights reserved.
//

#ifndef RequestDefine_h
#define RequestDefine_h

static NSString *const serverTokenKey               = @"token";         //服务端返回token Key
static NSString *const userTokenKey                 = @"user_token";    //用户token Key
static NSString *const phoneVerificationCodeKey     = @"code";          //手机验证码Key

static NSString *const typeKey                      = @"type";               //举报类型Key
static NSString *const reportIDKey                  = @"jw_id";              //举报IDKey
static NSString *const sendNumberKey                = @"report_mobile";    //发送骚扰电话， 诈骗电话 ，垃圾短信的号码Key
static NSString *const acceptNumberKey              = @"accept_mobile";    //接收骚扰电话， 诈骗电话 ，垃圾短信的号码Key
static NSString *const addressKey                   = @"report_address";        //实体店地址， 不良WIFI地址 ，伪基站地址的号码Key
static NSString *const callLengthKey                = @"talk_time";        //骚扰电话, 诈骗电话时间长度Key
static NSString *const callTimeKey                  = @"call_time";        //骚扰电话, 诈骗电话时间Key
static NSString *const nameKey                      = @"name";        //举报名称 (App, WIFI, 伪基站,实体店或者网店名字) Key
static NSString *const reportTypeKey                = @"report_type";        //骚扰电话, 诈骗电话时间Key
static NSString *const contentKey                   = @"content";       //举报内容Key

static NSString *const crankCallStatusKey           = @"harass_type";      //骚扰形式Key

static NSString *const websiteURLKey                = @"report_www";       //不良网站URL Key

static NSString *const AppSourceKey                 = @"source";        //不良App来源Key

static NSString *const buyNumberKey                 = @"buy_mobile";           //购买的号码Key
static NSString *const buyTimeKey                   = @"buy_time";                //购买时间Key
static NSString *const operatorKey                  = @"operator";               //运营商Key
static NSString *const storeImageKey               = @"img";                 //实体店照片Key
static NSString *const userImageKey                = @"card_img";             //用户持卡照片Key
static NSString *const reasonKey                    = @"reason";                   //违规原因Key
static NSString *const storeWebsiteKey              = @"store_website";             //网店网址Key
static NSString *const storeSaleWebsiteKey          = @"store_sale_website";        //网店销售页面Key

static NSString *const versionKey                   = @"version";          //版本 Key


#endif /* RequestDefine_h */

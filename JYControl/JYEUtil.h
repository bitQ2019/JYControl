//
//  JYEUtil.h
//  JYControl
//
//  Created by mq on 14-8-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

//UIViewController * rootViewController;
#define kDefaultServer @"192.168.1.10"
#define kDefaultPort @"8899"


@interface JYEUtil : NSObject



// 连接
+(NSString *)formConnectMessage;


+(NSString *)formControlMessageWithButtonTag:(NSInteger)tag  SendMessage:(NSString *)input;



+(BOOL) isFirstTimeLogin;

+(void)setFirstTimeLoginOver;

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message inViewWithButton:(NSString *)buttonName;


+(void)showConnectServerSuccess;

+(void)alertConnectServerFail;


+(UIViewController *)getCurrentRootViewController;

+(BOOL)isValidatIPAndPort:(NSString *)ipAddress serverPort:(NSString *)port;
@end

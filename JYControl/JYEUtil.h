//
//  JYEUtil.h
//  JYControl
//
//  Created by mq on 14-8-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

//UIViewController * rootViewController;
#define kConnectNotificaton @"ConnectNotification"
#define kDefaultServer @"192.168.1.10"
#define kDefaultPort @"8899"


@interface JYEUtil : NSObject



// 连接
+(NSString *)formConnectMessage;


+(NSString *)formControlMessageWithButtonTag:(NSInteger)tag  SendMessage:(NSString *)input;

+(NSString *)formControlMessageWithSliderValue:(NSInteger)value SendMessage:(NSString *)message Type:(NSInteger)type;


+(BOOL) isFirstTimeLogin;

+(void)setFirstTimeLoginOver;

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message inViewWithButton:(NSString *)buttonName;


+(void)showConnectServerSuccess;

+(void)alertConnectServerFail;


+(UIViewController *)getCurrentRootViewController;

+(BOOL)isValidatIPAndPort:(NSString *)ipAddress serverPort:(NSString *)port;

+(void)sendMessageWithType:(NSUInteger)type valueNow:(float)value valueOri:(NSUInteger *)oriValue;

+(void)saveSliderValueWithColor:(NSUInteger) colorValue light:(NSUInteger) lightValue temprature:(NSUInteger)tempratureValue


@end

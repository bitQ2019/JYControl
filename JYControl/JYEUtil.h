//
//  JYEUtil.h
//  JYControl
//
//  Created by mq on 14-8-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYEUtil : NSObject



// 连接
+(NSString *)formConnectMessage;


+(NSString *)formControlMessageWithButtonTag:(NSInteger)tag  SendMessage:(NSString *)input;



+(BOOL) isFirstTimeLogin;

+(void)setFirstTimeLoginOver;

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message inViewWithButton:(NSString *)buttonName;

@end

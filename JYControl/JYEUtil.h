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
+(NSString *)formConnectMessageWithButtonTag:(int)tag  SendMessage:(NSString *)input;


+(NSString *)formControlMessageWithButtonTag:(int)tag  SendMessage:(NSString *)input;

+(NSString *)addressCode;

+(BOOL)isFirstTime;

@end

//
//  JYECommandSender.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYECommandSender.h"



@implementation JYECommandSender

-(JYECommandSender *)shareSender
{
    static JYECommandSender *sender;
    static dispatch_once_t senderToken;
    dispatch_once(&senderToken, ^{
        
        sender = [[JYECommandSender alloc] init];
        
    });
    
    return sender;
}
@end

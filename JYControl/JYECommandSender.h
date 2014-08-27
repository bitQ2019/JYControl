//
//  JYECommandSender.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYECommandSender : NSObject

+(JYECommandSender *)shareSender;

@property(nonatomic,assign,readonly)BOOL isConnected;

-(BOOL)connectToServer:(NSString *)host port:(int)port;

-(void)sendMessage:(NSString *)message;

@end

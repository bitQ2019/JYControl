//
//  JYEUtil.m
//  JYControl
//
//  Created by mq on 14-8-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#define kHeadString @"SAT:"

#import "JYEUtil.h"

@implementation JYEUtil

+(NSString *)formConnectMessageWithButtonTag:(int)tag  SendMessage:(NSString *)input{
    
    NSMutableString *outPut = [[NSMutableString alloc] initWithString:kHeadString];
    
    [outPut appendString:[NSString stringWithFormat:@"%d-:%@-:%@-:CRL",tag,[JYEUtil addressCode],input]];
    
    
    return outPut;
}


+(NSString *)formControlMessageWithButtonTag:(int)tag  SendMessage:(NSString *)input{
    
    NSMutableString *outPut = [[NSMutableString alloc] initWithString:kHeadString];
    
    [outPut appendString:[NSString stringWithFormat:@"%d-:%@-:%@-:CRL",tag,[JYEUtil addressCode],input]];
    
    
    return outPut;
    
}

+(NSString *)addressCode
{
    return @"";
}

@end

//
//  JYEUtil.m
//  JYControl
//
//  Created by mq on 14-8-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#define kHeadString @"SAT:"
#define kFristTime @"isFirstTime"
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

+(BOOL)isFirstTime
{
    NSNumber *isFirstTime  =
    
    [[NSUserDefaults standardUserDefaults] valueForKey:kFristTime];
    
    
    
    return [isFirstTime boolValue];
}

@end

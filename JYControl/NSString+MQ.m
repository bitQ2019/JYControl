//
//  NSString+MQ.m
//  
//
//  Created by mq on 14-10-9.
//
//

#import "NSString+MQ.h"

@implementation NSString(MQQ)


-(NSString *)deleteSpace
{
    
    NSString * tempString = self;
    while ([tempString hasSuffix:@" "]) {
        
      tempString = [tempString substringToIndex:self.length-2];
    }
    
    return tempString;
}

@end

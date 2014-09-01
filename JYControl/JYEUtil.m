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

+(NSString *)formConnectMessage{

    NSMutableString *outPut = [[NSMutableString alloc] initWithString:kHeadString];
    
    [outPut appendString:[NSString stringWithFormat:@"PA%@-PB%@-PC%@-PD%@-PE%@-PF",[JYEDataStore shareInstance].serverAddress,[[JYEDataStore shareInstance].serverPort stringValue],[JYEDataStore shareInstance].serverCode,[JYEDataStore shareInstance].ssidString,[JYEDataStore shareInstance].passwordString]];
    
    NSLog(@"%@",outPut);
    
    return outPut;
}


+(NSString *)formControlMessageWithButtonTag:(NSInteger)tag  SendMessage:(NSString *)input{
    
      NSMutableString *outPut = [[NSMutableString alloc] initWithString:kHeadString];
    
    if (tag< 10) {
      
        
        [outPut appendString:[NSString stringWithFormat:@"0%d-:%@-:%@-:CRL",tag,[JYEDataStore shareInstance].serverCode,input]];
    }
    else
    {
    
    [outPut appendString:[NSString stringWithFormat:@"%d-:%@-:%@-:CRL",tag,[JYEDataStore shareInstance].serverCode,input]];
    
    }
    return outPut;
    
}



+(BOOL) isFirstTimeLogin{
    
    NSDictionary *option = @{@"firstTime": @"YES"};
    [[NSUserDefaults standardUserDefaults] registerDefaults:option];
    
    NSString *isString = [[NSUserDefaults standardUserDefaults] valueForKey:@"firstTime"];
    
    if ([isString isEqualToString:@"YES"]) {
        
        return YES;
        
    }
    else{
        
        return NO;
    }
    
}
+(void)setFirstTimeLoginOver{
    
    [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"firstTime"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message inViewWithButton:(NSString *)buttonName{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonName otherButtonTitles: nil];
    
    [alert show];
    
    
}

@end

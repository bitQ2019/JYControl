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
+(void)showConnectServerSuccess
{
    [JYEUtil showAlertWithTitle:@"" message:@"连接成功" inViewWithButton:@"OK"];
}


+(void)alertConnectServerFail
{
    [JYEUtil showAlertWithTitle:@"错误" message:@"连接服务器失败" inViewWithButton:@"OK"];
}


+(UIViewController *)getCurrentRootViewController {
    
    UIViewController *result;
    
    // Try to find the root view controller programmically
    
    // Find the top window (that is not an alert view or other window)
    
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (topWindow.windowLevel != UIWindowLevelNormal)
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(topWindow in windows)
            
        {
            
            if (topWindow.windowLevel == UIWindowLevelNormal)
                
                break;
            
        }
        
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        result = nextResponder;
    
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        
        result = topWindow.rootViewController;
    
    else
        
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
    
    return result;    
    
}

@end

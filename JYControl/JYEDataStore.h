//
//  JYEDataStore.h
//  JYControl
//
//  Created by mq on 14-8-27.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYEDataStore : NSObject<NSCoding>

+(JYEDataStore *)shareInstance;

@property (nonatomic,strong) NSString *serverAddress;
@property (nonatomic,strong) NSNumber *serverPort;
@property (nonatomic,strong) NSString *serverCode;
@property (nonatomic,strong) NSString *ssidString;
@property (nonatomic,strong) NSString *passwordString;
@property (nonatomic,strong) NSString *firstTitle;
@property (nonatomic,strong) NSString *secondTitle;

-(void)save;
@end

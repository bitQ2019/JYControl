//
//  JYEDataStore.m
//  JYControl
//
//  Created by mq on 14-8-27.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//


#define kData  @"Data"
#define kServerAddress @"ServerAddress"
#define kServerPort @"ServerPort"
#define kServerCode @"ServerCode"
#define kSSID @"SSID"
#define kPassword @"Password"
#define kFirstTitle @"FirstTitle"
#define kSecondTitle @"SecondTitle"
#import "JYEDataStore.h"

@implementation JYEDataStore
static JYEDataStore * dataStore;

+(JYEDataStore *)shareInstance
{
  
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[JYEDataStore alloc] init];
        
        if ([JYEUtil isFirstTimeLogin]) {
            
            [dataStore save];
            
            [JYEUtil setFirstTimeLoginOver];
        }
        else
        {
            [dataStore read];
        }
        
        
    });
    
    
    return dataStore;
}
-(id)init
{
    if (self = [super init]) {
        
        if ([JYEUtil isFirstTimeLogin]) {
            
            [self setDefaultValue];
            
//            [[JYEDataStore shareInstance] save];
    
        }
        
    }
    
    return self;
}


-(void)setDefaultValue{
    _serverAddress = kDefaultServer;
    _serverPort = [NSNumber numberWithInteger:8899];
    _serverCode = @"123456789";
    _ssidString = @"Ab1981";
    _passwordString = @"88888888";
    _firstTitle = _secondTitle = @"智能控制";
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.serverAddress forKey:kServerAddress];
    [aCoder encodeObject:self.serverPort forKey:kServerPort];
    
    [aCoder encodeObject:self.serverCode forKey:kServerCode];
    
    [aCoder encodeObject:self.ssidString forKey:kSSID];
    
    [aCoder encodeObject:self.passwordString forKey:kPassword];
    
    [aCoder encodeObject:self.firstTitle forKey:kFirstTitle];
    
    [aCoder encodeObject:self.secondTitle forKey:kSecondTitle];
    
    
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (!self) {
        
        self = [super init];
    }
    
    self.serverAddress = [aDecoder decodeObjectForKey:kServerAddress];
    
    self.serverPort = [aDecoder decodeObjectForKey:kServerPort];
    
    self.serverCode = [aDecoder decodeObjectForKey:kServerCode];
    
    self.ssidString = [aDecoder decodeObjectForKey:kSSID];
    
    self.passwordString = [aDecoder decodeObjectForKey:kPassword];
    
    self.firstTitle = [aDecoder decodeObjectForKey:kFirstTitle];
    
    self.secondTitle = [aDecoder decodeObjectForKey:kSecondTitle];
    
    
    return self;
}

-(void)save
{
     NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    [[NSUserDefaults standardUserDefaults] setObject:archiveData forKey:kData];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)read
{
    
    NSData *unarchiveData =
    
    [[NSUserDefaults standardUserDefaults] objectForKey:kData];
    
     dataStore  = [NSKeyedUnarchiver  unarchiveObjectWithData:unarchiveData];
    
}



@end

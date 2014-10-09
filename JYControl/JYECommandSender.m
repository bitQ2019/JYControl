//
//  JYECommandSender.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

//  add  state  isConnecting
#import "JYECommandSender.h"
#import "AsyncSocket.h"
#import "MBProgressHUD.h"
#import "UIView+Extend.h"
#import "NSString+MQ.h"




@interface JYECommandSender ()
{
    AsyncSocket *_asyncSocket;
    NSString *_host;
    int _port;
    ConnectType _connectType;
    NSTimer *_timer;
    
}
@property(nonatomic,assign)ConnectStates isConnected;
@end

@implementation JYECommandSender

+(JYECommandSender *)shareSender
{
    static JYECommandSender *sender;
    static dispatch_once_t senderToken;
    dispatch_once(&senderToken, ^{
        
        sender = [[JYECommandSender alloc] init];
        
        [NSTimer scheduledTimerWithTimeInterval:2 target:sender selector:@selector(testConnection) userInfo:nil repeats:YES];
        
    });
    
    return sender;
}

-(id)init
{
    if (self = [super init]) {
        
        _asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
        // 断开
        _isConnected = disConnected;
        
        _connectType = customServer;
        
        
    }
    
    return self;
}


-(ConnectStates)connectToServer:(NSString *)host port:(int)port;
{
    if(_isConnected != disConnected)
    {
        return _isConnected;
    }
    
    _host = host;
    
    _port = port;
    
    NSError *error = nil;
    
    if(![_asyncSocket connectToHost:_host onPort:_port error:&error])
        
    {
        
        NSLog(@"Error: %@", error);
        
        return   _isConnected = disConnected;
        
        
    }
    
    
    return  _isConnected = connecting;
    
    
}

-(ConnectStates)isConnected
{
    // 重连
    if (_isConnected ==disConnected) {
        
        return  [self connectToDefaultServer];
    }
    
    return _isConnected;
}

-(void)sendMessage:(NSString *)message
{
    
    if ([self isConnected] == connected) {
        
        [_asyncSocket writeData:[message dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
        
    }
    
    
}



-(ConnectStates)connectToDefaultServer
{
    if (  _connectType== customServer ) {
        
        return [self connectToServer:[JYEDataStore shareInstance].serverAddress port:[[JYEDataStore shareInstance].serverPort intValue]];

        
        
    }
    
    return    [[JYECommandSender shareSender] connectToServer:kDefaultServer port:[kDefaultPort intValue]];

    
}

-(void)disConnect
{
//    if (_isConnected == disConnected) {
//        
//        return;
//    }
 
        
        [_asyncSocket disconnect];
        
    
    
    //    _isConnected = false;
}

-(void)testConnection
{
    
    
    
    if (_isConnected == connecting) {
        

    }
    else if(_isConnected == connected)
    {
        
        [self checkConnectServer];
    }
    else
    {
        [self connectToDefaultServer];
        
    }
    
}



-(void)disConnectWithType:(ConnectType)type
{
    _connectType = type;
    
//    if ([[JYEDataStore shareInstance].serverAddress isEqualToString:kDefaultServer]&&[[[JYEDataStore shareInstance].serverPort stringValue] isEqualToString:kDefaultPort]) {
//        
//        return;
//        
//    }
    
    [self disConnect];
}

-(void)checkConnectServer
{
    if (_connectType == customServer ) {
        
        if ([[_asyncSocket connectedHost] isEqualToString:[JYEDataStore shareInstance].serverAddress]&&[[JYEDataStore shareInstance].serverPort intValue]== [_asyncSocket connectedPort]) {
            
            [self sendMessage:@"heart_beat"];
        }
       // 正确
        else
        {
            [self disConnect];
        }
     
    }
    else
    {
        if ([[_asyncSocket connectedHost] isEqualToString:kDefaultServer]&&[kDefaultPort intValue]== [_asyncSocket connectedPort]) {
            
            [self sendMessage:@"heart_beat"];
            
        }
        else
        {
            [self disConnect];
        }
    }
    
}

#pragma mark - delegate


- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    
    NSLog(@"onSocket:%p didConnectToHost:%@ port:%hu",sock,host,port);
    
    _timer = nil;
    
    _isConnected = connected;
    
    [JYEUtil showConnectServerSuccess];
    
//      [sock readDataWithTimeout:1 tag:0];
}
- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
      [sock readDataWithTimeout: -1 tag: 0];
    
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
    NSString* aStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    aStr = @"END";
    [aStr deleteSpace];
    NSLog(@"%@",aStr);
    
    if ([aStr containsString:@"END"]) {
        
        [JYEUtil parseReturnString:aStr];
        
    }
    
//      [sock readDataWithTimeout:-1 tag:0];
}

- (void)onSocket:(AsyncSocket *)sock didSecure:(BOOL)flag
{
    NSLog(@"onSocket:%p didSecure:YES", sock);
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"onSocket:%p willDisconnectWithError:%@", sock, err);
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    
    _isConnected = disConnected;
    
    [JYEUtil alertConnectServerFail];
    [self connectToDefaultServer];
    
    
}
@end




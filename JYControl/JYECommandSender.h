
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ConnectStates) {
    disConnected,
    connecting,
    connected
};

typedef NS_ENUM(NSUInteger, ConnectType) {
    customServer,
    defaultServer
    
};



@interface JYECommandSender : NSObject

+(JYECommandSender *)shareSender;

@property(nonatomic,assign,readonly)ConnectStates isConnected;

-(ConnectStates)connectToServer:(NSString *)host port:(int)port;

-(void)sendMessage:(NSString *)message;



-(ConnectStates)connectToDefaultServer;

-(void)disConnect;

-(void)disConnectWithType:(ConnectType) type;

@end
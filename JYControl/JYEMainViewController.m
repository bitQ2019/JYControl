//
//  JYEViewController.m
//  JYControl
//
//  Created by mq on 14-8-19.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYEMainViewController.h"
#import "AsyncSocket.h"
@interface JYEMainViewController ()

@end

@implementation JYEMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    AsyncSocket *asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    
    NSError *err = nil;
    NSString *hostString  = @"192.168.1.101";
    NSData *host = [hostString dataUsingEncoding:NSUTF8StringEncoding];
    int port = 3000;
    
    if(![asyncSocket connectToHost:hostString onPort:port error:&err])
        
    {
        
        NSLog(@"Error: %@", err);
        
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

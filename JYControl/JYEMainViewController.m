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
    
    
    if ([[JYECommandSender shareSender] connectToDefaultServer]) {
        
        //           [[JYECommandSender shareSender] sendMessage:[JYEUtil formConnectMessage]];
        
        
    }else
    {
        
    }
    


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveConnectNotification:) name:kConnectNotificaton object:nil];
   	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *segue = nil;
    
    if(sender.tag == 1)
    {
       segue = @"FirstSegue";
    }
    else if(sender.tag == 2)
    {
        segue = @"SecondSegue";
    }
    
    if (segue) {
        
          [self performSegueWithIdentifier:segue sender:nil];
    }
   
}

-(void)receiveConnectNotification:(NSNotification *)notification
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),notification.userInfo);
}
@end

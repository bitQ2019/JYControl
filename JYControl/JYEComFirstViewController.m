//
//  JYEComFirstViewController.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYEComFirstViewController.h"

@interface JYEComFirstViewController ()
{
    NSUInteger _buttonTag;
    NSTimer *_longPressEventTimer;

}
- (IBAction)buttonTouchCancel:(id)sender;
@end

@implementation JYEComFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    _longPressGesture.minimumPressDuration = 1000;
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveConnectNotification:) name:kConnectNotificaton object:nil];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonPressed:(UIButton *)sender {
    
    
    
   NSString * commendString = [JYEUtil formControlMessageWithButtonTag:sender.tag SendMessage:@""];
    
     _buttonTag = sender.tag;
    
    [[JYECommandSender shareSender] sendMessage:commendString];
    
    if (sender.tag > 2 && sender.tag <7) {
        
        if (!_longPressEventTimer) {
        
        _longPressEventTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(sendIntrevalCommend:) userInfo:nil repeats:YES];
            

        }
       
        
    }
   
    
}

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)longPressButton:(UIButton *)sender {
    
   
    
    NSLog(@"Button:%ld",(long)sender.tag);
    
    
}
-(void)sendIntrevalCommend:(id)sender
{
    
    NSLog(@"long press function");
    
    [[JYECommandSender shareSender] sendMessage:[JYEUtil formControlMessageWithButtonTag:_buttonTag SendMessage:@""]];
    
}
- (IBAction)buttonTouchCancel:(UIButton *)sender {
    
  
    [self stopTimer];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self stopTimer];
}


-(void)stopTimer
{
    [_longPressEventTimer invalidate];
    _longPressEventTimer = nil;

}

-(void)receiveConnectNotification:(NSNotification *)notification
{
     NSLog(@"%@,%@",NSStringFromClass([self class]),notification.userInfo);

}

@end

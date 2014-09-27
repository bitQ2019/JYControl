//
//  JYEComSecondViewController.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYEComSecondViewController.h"
@interface JYEComSecondViewController ()
{
    NSUInteger colorValue;
    NSUInteger lightValue;
}
@end

@implementation JYEComSecondViewController

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
    
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveConnectNotification:) name:kConnectNotificaton object:nil];
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"ColorValue"]) {
        
        colorValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"ColorValue"];
        lightValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"LightValue"];
        
    }
    else
    {
        lightValue = 0;
        colorValue = 0;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (IBAction)closeView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)buttonPressed:(UIButton *)sender{
    
    NSString * commendString = [JYEUtil formControlMessageWithButtonTag:sender.tag SendMessage:@""];
    
    [[JYECommandSender shareSender] sendMessage:commendString];
    

    
    
}

-(void)receiveConnectNotification:(NSNotification *)notification
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),notification.userInfo);
}
- (IBAction)sendValueChangeCommand:(UISlider *)sender{
    
    NSLog(@"%f",sender.value);
    
  
    if (sender.tag == 100 ) {
        
        [self sendMessageWithType:0 valueNow:sender.value valueOri:&colorValue];
        
    }
    else
    {
        [self sendMessageWithType:1 valueNow:sender.value valueOri:&lightValue];
    }
    
    
    
    [self saveSliderValue];
    
}

-(void)saveSliderValue
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:colorValue] forKey:@"ColorValue"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:lightValue] forKey:@"LightValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)sendMessageWithType:(NSUInteger)type valueNow:(float)value valueOri:(NSUInteger *)oriValue
{
    float  f = value - *oriValue;
    
    if (f> 3|| f < -3) {
        
        
        
        NSString * message = [JYEUtil formControlMessageWithSliderValue:value SendMessage:@"" Type:type];
        
        [[JYECommandSender shareSender] sendMessage:message];
        
           *oriValue = value;
        
    }
    
 

}
@end

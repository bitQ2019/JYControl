//
//  JYESettingViewController.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYESettingViewController.h"
#import "MBProgressHUD.h"
#import "UIView+Extend.h"

@interface JYESettingViewController ()

@end

@implementation JYESettingViewController

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
    
    [self initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveConnectNotification:) name:kConnectNotificaton object:nil];
    
    
    // Do any additional setup after loading the view.
}

-(void)initView
{
    JYEDataStore *dataStore  =  [JYEDataStore shareInstance];
    
    self.netSegmentedControl.selectedSegmentIndex = 1;
    _address.text = dataStore.serverAddress;
    _port.text = [dataStore.serverPort stringValue];
    _addressCode.text = dataStore.serverCode;
    _password.text = dataStore.passwordString;
    _SSID.text = dataStore.ssidString;
    
//    if ([dataStore.serverAddress  isEqual: @"192.168.1.10"]&& [[dataStore.serverPort stringValue] isEqualToString:@"8899"]) {
//        
//        return;
//    }
//    
    [[JYECommandSender shareSender] disConnectWithType:defaultServer];
//
//    [[JYECommandSender shareSender] connectToServer:@"192.168.1.10" port:8899];
    
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

- (IBAction)tabValueChanged:(UISegmentedControl *)sender {
    
    NSLog(@"%ld",(long)sender.selectedSegmentIndex);
    
    
    if (sender.selectedSegmentIndex) {
        
        _address.text =  [JYEDataStore shareInstance].serverAddress;
        
        _port.text = [[JYEDataStore shareInstance].serverPort stringValue];
        
    }
    else
    {
        _address.text = kDefaultServer;
        _port.text = kDefaultPort;
        
    }
    
    
    
}

- (IBAction)textFieldEndEdit:(UITextField *)sender {
    
    if (self.view.frame.origin.y < 0) {
        
        [UIView animateWithDuration:0.1f animations:^(){
            
            CGRect frame = self.view.frame;
            frame.origin.y += 200.0f;
            self.view.frame = frame;
            
        }];

    }
    
    
    [sender resignFirstResponder];
    
}

- (IBAction)cancelKeyboard:(id)sender {
    
    for (UIView *subView in [self.view subviews]) {
        
        if ([subView isKindOfClass:[UITextField class]]) {
            
            UITextField *view = (UITextField *)subView;
            

            [self textFieldEndEdit:view];
            
//            [view resignFirstResponder];
        }
    }
    
}

- (IBAction)closeView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^()
     {
         [[JYECommandSender shareSender] disConnectWithType:customServer];
     }];
}

- (IBAction)beginEdit:(id)sender {
    
    if (self.view.frame.origin.y == 0) {
        
        [UIView animateWithDuration:0.5f animations:^(){
            
            CGRect frame = self.view.frame;
            frame.origin.y -= 200.0f;
            self.view.frame = frame;
            
        }];
        
    }
}

- (IBAction)save:(id)sender {
    
    JYEDataStore *dataStore  =   [JYEDataStore shareInstance];
    
    if (![JYEUtil isValidatIPAndPort:_address.text serverPort:_port.text]) {
        
        // 输入错误，连接到default;
        
        [[[UIAlertView alloc] initWithTitle:@"错误" message:@"IP或者端口错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        
        [dataStore setDefaultValue];
        
     
        
    }
    else
    {
        // 正确
        dataStore.serverCode = _addressCode.text;
        dataStore.serverAddress = _address.text;
        dataStore.passwordString = _password.text;
        dataStore.ssidString = _SSID.text;
        
        dataStore.serverPort = [NSNumber numberWithInteger:[_port.text integerValue]];
        
   
    }
    
    [dataStore save];
    
    
    [[JYECommandSender shareSender] sendMessage:[JYEUtil formConnectMessage]];
    
    
    
    
    
//    [self.view showNotification:@"发送成功" WithStyle:hudStyleSuccess];
    
    
//    [UIView animateWithDuration:1 animations:^(){
//    
//        [self dismissViewControllerAnimated:YES completion:^(){
//            
//            
//            
//            [[JYECommandSender shareSender] disConnectWithType:0];
//            
//        }];
//
//    }];
//
}

-(void)receiveConnectNotification:(NSNotification *)notification
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),notification.userInfo);
    
    if ([[notification.userInfo valueForKey:@"connect"] unsignedIntegerValue]) {
        
        _wifi.highlighted = YES;
        
    }
    else
    {
        _wifi.highlighted = NO;
    }

}
@end

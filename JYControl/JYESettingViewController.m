//
//  JYESettingViewController.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYESettingViewController.h"



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

- (IBAction)textFieldEndEdit:(UITextField *)sender {
    
    [sender resignFirstResponder];
}

- (IBAction)cancelKeyboard:(id)sender {
}

- (IBAction)save:(id)sender {
    
    JYEDataStore *dataStore  =   [JYEDataStore shareInstance];
    dataStore.serverCode = _addressCode.text;
    dataStore.serverAddress = _address.text;
    dataStore.passwordString = _password.text;
    dataStore.ssidString = _SSID.text;
    
    dataStore.serverPort = [NSNumber numberWithInteger:[_port.text integerValue]];
    
    [dataStore save];
    
    [[JYECommandSender shareSender] connectToServer:_address.text port:[_port.text integerValue]];
}
@end

//
//  JYESettingViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYESettingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *port;
@property (strong, nonatomic) IBOutlet UITextField *addressCode;
@property (strong, nonatomic) IBOutlet UITextField *SSID;
@property (strong, nonatomic) IBOutlet UITextField *password;

- (IBAction)textFieldEndEdit:(id)sender;
- (IBAction)cancelKeyboard:(id)sender;
- (IBAction)closeView:(id)sender;
- (IBAction)beginEdit:(id)sender;

- (IBAction)save:(id)sender;
@end

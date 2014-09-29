//
//  JYESettingViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYESettingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *wifi;

@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *port;
@property (strong, nonatomic) IBOutlet UITextField *addressCode;
@property (strong, nonatomic) IBOutlet UITextField *SSID;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UISegmentedControl *netSegmentedControl;

- (IBAction)tabValueChanged:(id)sender;
- (IBAction)textFieldEndEdit:(id)sender;
- (IBAction)cancelKeyboard:(id)sender;
- (IBAction)closeView:(id)sender;
- (IBAction)beginEdit:(id)sender;

- (IBAction)save:(id)sender;
@end

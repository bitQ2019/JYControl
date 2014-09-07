//
//  JYEComFirstViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYEComFirstViewController : UIViewController

- (IBAction)buttonPressed:(id)sender;

- (IBAction)closeView:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *wifiLable;

@property (strong, nonatomic) IBOutlet UIButton *colorMinus;
@property (strong, nonatomic) IBOutlet UIButton *colorPlus;
@property (strong, nonatomic) IBOutlet UIButton *lightMinus;
@property (strong, nonatomic) IBOutlet UIButton *lightPlus;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;
- (IBAction)longPressButton:(id)sender;
@end

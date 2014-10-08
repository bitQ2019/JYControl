//
//  JYEComFirstViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICircularSlider.h"
#import "JYESlider.h"
@interface JYEComFirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *wifi;
- (IBAction)buttonPressed:(id)sender;

- (IBAction)closeView:(id)sender;

@property (strong, nonatomic) IBOutlet JYESlider *lightSlider;

@property (strong, nonatomic) IBOutlet JYESlider *colorSlider;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;
@property (strong, nonatomic) IBOutlet UICircularSlider *circleSlider;
@property (strong, nonatomic) IBOutlet UILabel *num4;
- (IBAction)sliderValueChange:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *num3;
- (IBAction)longPressButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *num2;
@property (strong, nonatomic) IBOutlet UILabel *num1;
@end

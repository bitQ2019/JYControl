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

- (IBAction)buttonPressed:(id)sender;

- (IBAction)closeView:(id)sender;

@property (strong, nonatomic) IBOutlet JYESlider *lightSlider;

@property (strong, nonatomic) IBOutlet JYESlider *colorSlider;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;
@property (strong, nonatomic) IBOutlet UICircularSlider *circleSlider;
- (IBAction)sliderValueChange:(id)sender;
- (IBAction)longPressButton:(id)sender;
@end

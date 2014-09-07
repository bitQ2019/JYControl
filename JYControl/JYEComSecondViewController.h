//
//  JYEComSecondViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYEComSecondViewController : UIViewController


- (IBAction)buttonPressed:(id)sender;
- (IBAction)closeView:(id)sender;

- (IBAction)sendValueChangeCommand:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *lightSlider;

@property (strong, nonatomic) IBOutlet UISlider *colorSlider;
@end

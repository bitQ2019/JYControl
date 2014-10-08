//
//  JYEComSecondViewController.h
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYEComSecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *wifi;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)closeView:(id)sender;

- (IBAction)sendValueChangeCommand:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *lightSlider;
@property (strong, nonatomic) IBOutlet UILabel *num3;
@property (strong, nonatomic) IBOutlet UILabel *num4;

@property (strong, nonatomic) IBOutlet UILabel *num2;
@property (strong, nonatomic) IBOutlet UISlider *colorSlider;
@property (strong, nonatomic) IBOutlet UILabel *num1;
@property (strong,nonatomic) IBOutlet NSArray *array;
@end

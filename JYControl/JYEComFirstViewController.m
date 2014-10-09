//
//  JYEComFirstViewController.m
//  JYControl
//
//  Created by mq on 14-8-25.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYEComFirstViewController.h"

@interface JYEComFirstViewController ()
{
    NSUInteger _buttonTag;
    NSTimer *_longPressEventTimer;
    
    
    //
    
    NSUInteger  colorValue;
    NSUInteger  lightValue;
    NSUInteger  temperatureValue;
    

}
- (IBAction)buttonTouchCancel:(id)sender;
@end

@implementation JYEComFirstViewController

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
    
    [self disAppearReturnLabel:nil];
   
    _longPressGesture.minimumPressDuration = 1000;
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * -0.5);
    
    [_lightSlider removeConstraints:_lightSlider.constraints];
    
    [_lightSlider setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    _lightSlider.transform = trans;

    
    [_colorSlider removeConstraints:_colorSlider.constraints];
    [_colorSlider setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    _colorSlider.transform = trans;
    
    _circleSlider.minimumTrackTintColor = [UIColor clearColor];
    
    _circleSlider.maximumTrackTintColor = [UIColor clearColor];
    
    // 滑块
    _circleSlider.sliderStyle = UICircularSliderStyleCircle;
    
    _circleSlider.thumbTintColor = [UIColor whiteColor];
    
    _circleSlider.minimumValue = 0;
    
    _circleSlider.maximumValue = 255;
//    
//    [_circleSlider addTarget:self action:@selector(updateProgress:) forControlEvents:UIControlEventValueChanged];
    if ([JYECommandSender shareSender].isConnected == connected) {
        
        _wifi.highlighted = YES;
    }

    
    
    
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"ColorValue"]) {
        
        colorValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"ColorValue"];
        lightValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"LightValue"];
        
        temperatureValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"TemperatureValue"];
        
    }
    else
    {
        lightValue = 0;
        colorValue = 0;
        temperatureValue = 0;
    }

//

//    _colorSlider.transform = trans;
//    
//    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 20, 200)];
//    slider.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:slider];
//    
//    [self.view bringSubviewToFront:slider];
//    
//    slider.transform = CGAffineTransformRotate(slider.transform, 0.5*M_PI);
//    
//    _lightSlider.transform = trans;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveConnectNotification:) name:kConnectNotificaton object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showReturnString:) name:kReturnStringNotification object:nil];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (IBAction)buttonPressed:(UIButton *)sender {
    
    
    
   NSString * commendString = [JYEUtil formControlMessageWithButtonTag:sender.tag SendMessage:@""];
    
     _buttonTag = sender.tag;
    
    [[JYECommandSender shareSender] sendMessage:commendString];
    
    if (sender.tag > 2 && sender.tag <7) {
        
        if (!_longPressEventTimer) {
        
        _longPressEventTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(sendIntrevalCommend:) userInfo:nil repeats:YES];
            

        }
       
        
    }
   
    
}

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sliderValueChange:(UIControl *)sender {
    
    
    NSLog(@"%ld",(long)sender.tag);
    
    
    if (sender.tag == 100 ) {
        
        JYESlider * slider = (JYESlider *)sender;
        
        [JYEUtil sendMessageWithType:0 valueNow:slider.value valueOri:&colorValue];
        
    }
    else if(sender.tag == 101)
    {
        JYESlider * slider = (JYESlider *)sender;
        [JYEUtil sendMessageWithType:1 valueNow:slider.value valueOri:&lightValue];
    }
    
    else if(sender.tag == 102)
    {
        UICircularSlider * slider = (UICircularSlider *)sender;
        
        [JYEUtil sendMessageWithType:2 valueNow:slider.value valueOri:&temperatureValue];
    }
    
    
    [JYEUtil saveSliderValueWithColor:colorValue light:lightValue temprature:-1];
    
}

- (IBAction)longPressButton:(UIButton *)sender {
    
   
    
    NSLog(@"Button:%ld",(long)sender.tag);
    
    
}
-(void)sendIntrevalCommend:(id)sender
{
    
    NSLog(@"long press function");
    
    [[JYECommandSender shareSender] sendMessage:[JYEUtil formControlMessageWithButtonTag:_buttonTag SendMessage:@""]];
    
}
- (IBAction)buttonTouchCancel:(UIButton *)sender {
    
  
    [self stopTimer];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self stopTimer];
}


-(void)stopTimer
{
    [_longPressEventTimer invalidate];
    _longPressEventTimer = nil;

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
-(void)showReturnString:(NSNotification *)notification
{
    
    
    if (_num1.alpha > 0) {
        return;
    }

    
    NSArray *numArray = notification.userInfo;
    
    _num1.text = [JYEUtil judgeStringByNum:numArray[0]];
    _num2.text = [JYEUtil judgeStringByNum:numArray[1]];
    _num3.text = [JYEUtil judgeStringByNum:numArray[2]];
    _num4.text = [JYEUtil judgeStringByNum:numArray[3]];
    
    [UIView animateWithDuration:0.5 animations:^(){
        
        [_num1 setAlpha:1];
        [_num2 setAlpha:1];
        [_num3 setAlpha:1];
        [_num4 setAlpha:1];
        
    }];
    
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(disAppearReturnLabel:) userInfo:nil repeats:NO];
}

-(void)disAppearReturnLabel:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^(){
        
        [_num1 setAlpha:0];
        [_num2 setAlpha:0];
        [_num3 setAlpha:0];
        [_num4 setAlpha:0];
        
    }];
}

@end

//
//  JYESlider.m
//  JYControl
//
//  Created by mq on 14-9-27.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYESlider.h"

@implementation JYESlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * -0.5);
        self.transform = trans;
        
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    
//        self.backgroundColor = [UIColor redColor];
    
    
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

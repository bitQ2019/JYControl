//
//  JYETransparencyView.m
//  JYControl
//
//  Created by mq on 14-9-26.
//  Copyright (c) 2014年 mqq.com. All rights reserved.
//

#import "JYETransparencyView.h"

@implementation JYETransparencyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self initView];
        // Initialization code
    }
    return self;
}
-(void)initView
{
    self.backgroundColor = [UIColor clearColor];
    
   
    
    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = 10.0f;
    
    self.layer.borderWidth = 1.0f;
    
    self.layer.borderColor = [[UIColor yellowColor] CGColor];
    

    
    
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

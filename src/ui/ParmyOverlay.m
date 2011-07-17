//
//  ParmyOverlay.m
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyOverlay.h"

#import "ParmyMainSelector.h"

@implementation ParmyOverlay

@synthesize window = _window;
@synthesize mainSelector = _mainSelector;

-(id) initWithFrame:(CGRect)frame 
{    
    self = [super initWithFrame:frame];
    if (self) 
	{
		self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
		self.opaque = NO;
		
		self.mainSelector = [[[ParmyMainSelector alloc] initWithFrame:CGRectMake(20,20,250,40)] autorelease];
		[self addSubview:_mainSelector];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc 
{
    [super dealloc];
}


@end

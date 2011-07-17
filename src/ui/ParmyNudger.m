//
//  ParmyNudger.m
//  ParmyLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyNudger.h"


@implementation ParmyNudger

@synthesize btnLeft = _btnLeft;
@synthesize btnRight = _btnRight;


-(id) initWithFrame:(CGRect)frame andDelegate:(id)delegate selLeft:(SEL)left selRight:(SEL)right
{
    self = [super initWithFrame:frame];
    if (self) 
	{
//		_delegate = delegate;
//		_selLeft = left;
//		_selRight = right;

		CGRect bf = CGRectMake(0, 0, frame.size.width/2, frame.size.height);
		
		self.btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
		[_btnLeft setBackgroundColor:[UIColor whiteColor]];
		[_btnLeft setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
		[_btnLeft setTitle:@"<" forState:UIControlStateNormal];
		_btnLeft.frame = bf;
		_btnLeft.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
		[_btnLeft addTarget:_delegate action:left forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_btnLeft];
		
		self.btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
		[_btnRight setBackgroundColor:[UIColor whiteColor]];
		[_btnRight setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
		[_btnRight setTitle:@">" forState:UIControlStateNormal];
		_btnRight.frame = bf;
		_btnRight.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
		[_btnRight addTarget:_delegate action:right forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_btnRight];
		
    }
    return self;
}

-(void) dealloc
{
	self.btnLeft = nil;
	self.btnRight = nil;
	
	[super dealloc];
}


@end

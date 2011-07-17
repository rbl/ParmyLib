//
//  ParmyNumericalAdjustment.m
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyNumericalAdjustment.h"


@implementation ParmyNumericalAdjustment

@synthesize slider = _slider;
@synthesize minLabel = _minLabel;
@synthesize currentLabel = _currentLabel;
@synthesize maxLabel = _maxLabel;

@synthesize moveMin = _moveMin;
@synthesize moveMax = _moveMax;

@synthesize decreaseSingle = _decreaseSingle;
@synthesize increaseSingle = _increaseSingle;


-(id) initForValue:(NSNumber*)num withDelegate:(id)delegate;
{
	if ((self = [super initWithFrame:CGRectMake(0,0,100,100)]))
	{
		CGRect frame = CGRectMake(0,5,22,100);
		self.currentLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_currentLabel.textAlignment = UITextAlignmentCenter;
		
		frame.origin.y += frame.size.height;
		
		self.slider = [[[UISlider alloc] initWithFrame:frame] autorelease];
	}
	return self;
}



-(void) dealloc
{
	self.slider = nil;
	self.minLabel =  nil;
	self.currentLabel = nil;
	self.maxLabel = nil;
	self.moveMin = nil;
	self.moveMax = nil;
	self.decreaseSingle = nil;
	self.increaseSingle = nil;
	
	[super dealloc];
}



@end

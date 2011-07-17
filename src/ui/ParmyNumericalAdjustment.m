//
//  ParmyNumericalAdjustment.m
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyNumericalAdjustment.h"

#import "ParmyNudger.h"

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
		_currentLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:_currentLabel];
		
		self.minLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_minLabel.textAlignment = UITextAlignmentLeft;
		_minLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:_minLabel];
		
		self.maxLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_maxLabel.textAlignment = UITextAlignmentRight;
		_maxLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:_maxLabel];
		
		// Next row
		frame.origin.y += frame.size.height;
		
		frame.size.height = 30;
		
		self.slider = [[[UISlider alloc] initWithFrame:frame] autorelease];
		[_slider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
		_slider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
		[self addSubview:_slider];
		
		float val = [num floatValue];
		float absVal = fabs(val);
		float max = absVal;
		
		if (absVal < 0.1) {
			max = 0.1;
		}
		else if (absVal < 1.0) 
		{
			max = 1.0;
		}
		else if (absVal < 10.0) 
		{
			max = 10.0;
		}
		else if (absVal < 100.0) 
		{
			max = 100.0;
		}
		else if (absVal < 1000.0) 
		{
			max = 1000.0;
		}
		else
		{
			max = absVal;
		}
		
		float min = 0;
		if (val < 0) 
		{
			float temp;
			temp = min;
			min = max;
			max = temp;
		}
		
		_slider.maximumValue = max;
		_slider.minimumValue = min;
		_slider.value = val;

		
		
		
		
		// Bottom row
		frame.origin.y += frame.size.height;
		frame.size.width = 2*frame.size.height;

		ParmyNudger *nudger;
		nudger = [[[ParmyNudger alloc] initWithFrame:frame 
										 andDelegate:self 
											 selLeft:@selector(nudgeMinDown) 
											selRight:@selector(nudgeMinUp)] autorelease];
		nudger.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
		[self addSubview:nudger];
		
		frame.origin.x = 50 - (frame.size.width / 2);
		nudger = [[[ParmyNudger alloc] initWithFrame:frame 
										 andDelegate:self 
											 selLeft:@selector(nudgeValueDown) 
											selRight:@selector(nudgeValueUp)] autorelease];
		nudger.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
		[self addSubview:nudger];

		frame.origin.x = 100 - (frame.size.width);
		nudger = [[[ParmyNudger alloc] initWithFrame:frame 
										 andDelegate:self 
											 selLeft:@selector(nudgeMaxDown) 
											selRight:@selector(nudgeMaxUp)] autorelease];
		nudger.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
		[self addSubview:nudger];
		
		
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

-(void) nudgeMinDown
{
}

-(void) nudgeMinUp
{
}

-(void) nudgeValueDown
{
}

-(void) nudgeValueUp
{
}

-(void) nudgeMaxDown
{
}

-(void) nudgeMaxUp
{
}

-(void) sliderMoved:(id)sender
{
}

@end

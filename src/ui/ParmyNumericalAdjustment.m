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
		_delegate = delegate;
		self.backgroundColor = [UIColor clearColor];
		
//		CGRect frame = CGRectMake(30, 30, 30, 30);
//		UIView* v = [[[UIView alloc] initWithFrame:frame] autorelease];
//		//v.frame = CGRectMake(0, 0, 768, 1024);
//		v.backgroundColor = [UIColor yellowColor];
//		[self addSubview:v];
		
		
		CGRect frame = CGRectMake(0,5,100,22);
		self.currentLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_currentLabel.textAlignment = UITextAlignmentCenter;
		_currentLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		_currentLabel.text = @"Cur";
		_currentLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_currentLabel];
		
//		UIView* v = [[[UIView alloc] initWithFrame:frame] autorelease];
//		v.frame = CGRectMake(0, 0, 768, 1024);
//		v.backgroundColor = [UIColor yellowColor];
//		[self addSubview:v];
		
		self.minLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_minLabel.textAlignment = UITextAlignmentLeft;
		_minLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		_minLabel.text = @"min";
		_minLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_minLabel];
		
		self.maxLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
		_maxLabel.textAlignment = UITextAlignmentRight;
		_maxLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		_maxLabel.text = @"MAX";
		_maxLabel.backgroundColor = [UIColor clearColor];
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
		
        
        
        _currentLabel.textColor = [UIColor whiteColor];
        _minLabel.textColor = [UIColor whiteColor];
        _maxLabel.textColor = [UIColor whiteColor];
		
		[self updateLabels];
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
	float span = _slider.maximumValue - _slider.minimumValue;
	
	float delta = span/2;
	_slider.minimumValue = _slider.minimumValue - delta;
	[self updateLabels];
}

-(void) nudgeMinUp
{
	float span = _slider.maximumValue - _slider.minimumValue;
	
	float delta = span/2;
	_slider.minimumValue = _slider.minimumValue + delta;
	[self updateLabels];
}

-(float) increment
{
	float span = _slider.maximumValue - _slider.minimumValue;
	float delta = span/2;
	
	float inc = 1.0;
	if (delta < 1.0) 
	{
		inc = 0.1;
	}
	else if (delta < 100.0)
	{
		inc = 1;
	}
	else if (delta < 1000.0)
	{
		inc = 10;
	}
	else
	{
		inc = delta / 100.0;
	}
	
	return inc;
}

-(void) nudgeValueDown
{
	_slider.value -= [self increment];


	[self updateLabels];
}

-(void) nudgeValueUp
{
	_slider.value += [self increment];

	[self updateLabels];
}

-(void) nudgeMaxDown
{
	float span = _slider.maximumValue - _slider.minimumValue;
	
	float delta = span/2;
	_slider.maximumValue = _slider.maximumValue - delta;
	[self updateLabels];	
}

-(void) nudgeMaxUp
{
	float span = _slider.maximumValue - _slider.minimumValue;
	
	float delta = span/2;
	_slider.maximumValue = _slider.maximumValue + delta;
	[self updateLabels];	
}

-(void) sliderMoved:(id)sender
{
	[self updateLabels];
}

-(void) updateLabels
{
	_currentLabel.text = [NSString stringWithFormat:@"%.2f", _slider.value];
	_minLabel.text = [NSString stringWithFormat:@"%.2f", _slider.minimumValue];
	_maxLabel.text = [NSString stringWithFormat:@"%.2f", _slider.maximumValue];
	
	[_slider setValue:_slider.value+0.1 animated:NO];
	[_slider setValue:_slider.value animated:YES];

	[_delegate valueChanged:_slider.value];
}

@end

//
//  ParmyAdjustmentPopover.m
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyAdjustmentPopover.h"

#import "ParmyRegistry.h"
#import "ParmyNumericalAdjustment.h"

@interface ParmyAdjustmentPopover()

-(void) loadNumericalAdjustment:(NSNumber*)num;

@end

@implementation ParmyAdjustmentPopover

@synthesize key = _key;
@synthesize adjView = _adjView;

-(id) initOnView:(UIView*)parent withKey:(NSString*)key andSet:(int)set
{    
    self = [super initOnView:parent];
    if (self) 
	{
		_set = set;
		self.key = key;
		
		_width = 300;
		_height = 160;
		
		self.view = [[[UIView alloc] initWithFrame:CGRectMake(0,0,_width,_height)] autorelease];
		self.view.backgroundColor = [UIColor clearColor];
		
		// Find the right type of adjustment sub-view to load
		NSObject* obj = [[ParmyRegistry sharedInstance] objectInSet:_set forKey:_key];
		
		if ([obj isKindOfClass:[NSNumber class]])
		{
			[self loadNumericalAdjustment:(NSNumber*)obj];
		}
		// else something else ...
    }
    return self;
}


-(void)dealloc 
{
	self.key = nil;
	self.adjView = nil;
	
    [super dealloc];
}


-(void) loadNumericalAdjustment:(NSNumber*)num
{
	self.adjView = [[[ParmyNumericalAdjustment alloc] initForValue:num withDelegate:self] autorelease];
	
	_adjView.frame = CGRectMake(0,0,_width,_height);
	_adjView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	[_view addSubview:_adjView];
}


-(void) valueChanged:(double)val
{
	[[ParmyRegistry sharedInstance] setDouble:val forKey:_key];
}


@end

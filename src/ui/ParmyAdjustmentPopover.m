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

-(void) loadNumericalAdjustment;

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
		
		self.view = [[[UIView alloc] initWithFrame:CGRectMake(0,0,100,100)] autorelease];
		self.view.backgroundColor = [UIColor purpleColor];
		
		// Find the right type of adjustment sub-view to load
		NSObject* obj = [[ParmyRegistry sharedInstance] objectInSet:_set ForKey:_key];
		
		if ([obj isKindOfClass:[NSNumber class]])
		{
			[self loadNumericalAdjustment:obj];
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
	bool isFloat = YES;	
	
	self.adjView = [[[ParmyNumericalAdjustment alloc] initForValue:num withDelegate:self] autorelease];
	
	_adjView.frame = CGRectMake(0,0,100,100);
	_adjView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	[_view addSubview:_adjView];
}


@end
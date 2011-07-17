//
//  ParmyLib.m
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SynthesizeSingleton.h"

#import "ParmyLib.h"
#import "ParmyLibInternal.h"

#import "ParmyRegistry.h"
#import "ParmyMainSelector.h"


@implementation NSString(ParmyLib)

-(double) pfv
{
	return [[ParmyRegistry sharedInstance] doubleForKey:self withDefault:0.0];
}

-(void) setPfv:(double)val
{
	[[ParmyRegistry sharedInstance] setDouble:val forKey:self];
}

-(double) pfvd:(double)defaultValue
{
	return [[ParmyRegistry sharedInstance] doubleForKey:self withDefault:defaultValue];
}




-(int) piv
{
	return [[ParmyRegistry sharedInstance] intForKey:self withDefault:0];
}

-(void) setPiv:(int)val
{
	[[ParmyRegistry sharedInstance] setInt:val forKey:self];
}

-(int) pivd:(int)defaultValue
{
	return [[ParmyRegistry sharedInstance] intForKey:self withDefault:defaultValue];
}

-(NSString*) psv
{
	return [[ParmyRegistry sharedInstance] stringForKey:self withDefault:@""];
}

-(void) setPsv:(NSString *)val
{
	[[ParmyRegistry sharedInstance] setString:val forKey:self];
}

-(NSString*) psvd:(NSString*)defaultValue
{
	return [[ParmyRegistry sharedInstance] stringForKey:self withDefault:defaultValue];
}


-(void) bindOnto:(NSString*)pName ofObject:(NSObject*)obj
{
	[[ParmyRegistry sharedInstance] bindName:self onto:pName ofObject:obj];
}
@end


@implementation NSDictionary(ParmyLib)

-(void) setParmyLibSet:(int)set
{
	[[ParmyRegistry sharedInstance] replaceParamSet:set with:self];
}

@end



@implementation ParmyLib


+(void) addToWindow:(UIWindow*)window
{
	[[ParmyLibInternal sharedInstance] addToWindow:window];
}

+(void) activateInWindow:(UIWindow*)window
{
	[[ParmyLibInternal sharedInstance] activateInWindow:window];
}

+(void) toggleInWindow:(UIWindow*)window
{
	[[ParmyLibInternal sharedInstance] toggleInWindow:window];
}


@end



@implementation ParmyLibInternal

SYNTHESIZE_SINGLETON_FOR_CLASS(ParmyLibInternal)
@synthesize mainSelector = _mainSelector;

-(void) addToWindow:(UIWindow*)window
{
}

-(void) activateInWindow:(UIWindow*)window
{
	if (!window) window = [[UIApplication sharedApplication] keyWindow];
	
	NSLog(@"Activating Parmy in window %@", window);
	
	//ParmyOverlay* overlay = [[[ParmyOverlay alloc] initWithFrame:window.frame] autorelease];
	self.mainSelector = [[[ParmyMainSelector alloc] initWithFrame:CGRectZero] autorelease];
	//overlay.window = window;
	[window addSubview:_mainSelector];	
}


-(void) toggleInWindow:(UIWindow*)window
{
	if (_mainSelector) 
	{
		// Showing it, so dismiss it
		[_mainSelector close];
		self.mainSelector = nil;
	}
	else
	{
		[self activateInWindow:window];
	}
}

@end

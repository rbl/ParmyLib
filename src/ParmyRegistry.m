//
//  ParmyRegistry.m
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyLib.h"
#import "ParmyRegistry.h"

#import "SynthesizeSingleton.h"

@interface ParmyRegistry()

@end

///////////////

@implementation ParmyRegistry

SYNTHESIZE_SINGLETON_FOR_CLASS(ParmyRegistry)

@synthesize currentSet = _currentSet;


-(id) init
{
	if ((self = [super init]))
	{
		for(int i=0; i<10; i++) 
		{
			_paramSets[i] = [[NSMutableDictionary alloc] init];
			_unsetKeys = [[NSMutableDictionary alloc] init];
			_bindings = [[NSMutableDictionary alloc] init];
		}
	}
	return self;
}

-(void) sendParamChangeNotificationForKey:(NSString*)key
{
	[[NSNotificationCenter defaultCenter] postNotificationName:PARMYLIB_PARAM_CHANGED object:key];
	
	// Find bindings and poke them
	NSArray* bindList = [_bindings objectForKey:key];
	if (!bindList) return;
	
	for (NSArray* binding in bindList)
	{
		UIView* target = (UIView*)[binding objectAtIndex:0];
		NSString* pN =  (NSString*)[binding objectAtIndex:1];
		NSNumber *num = (NSNumber*)[_paramSets[_currentSet] objectForKey:key];
		
		CGRect frame = target.frame;
		if ([pN isEqual:@"x"]) 
		{
			frame.origin.x = [num floatValue];
			target.frame = frame;
		}
		else if ([pN isEqual:@"y"]) 
		{
			frame.origin.y = [num floatValue];
			target.frame = frame;
		}
		else if ([pN isEqual:@"width"]) 
		{
			frame.size.width = [num floatValue];
			target.frame = frame;
		}
		else if ([pN isEqual:@"height"]) 
		{
			frame.size.height = [num floatValue];
			target.frame = frame;
		}
		else
		{
			[target setValue:num forKey:pN];
		}		
	}
}



-(double) doubleForKey:(NSString*)key withDefault:(double)def
{
	NSNumber* num = [_paramSets[_currentSet] objectForKey:key];
	if (num) return [num doubleValue];
	
	// Need to register this as an unset parameter
	[_unsetKeys setObject:@"double" forKey:key];
	return def;	
}

-(void) setDouble:(double)val forKey:(NSString*)key
{
	double existing = [self doubleForKey:key withDefault:val];
	BOOL isNew = existing != val;

	[_paramSets[_currentSet] setObject:[NSNumber numberWithDouble:val] forKey:key];

	if (isNew) [self sendParamChangeNotificationForKey:key];
}




-(int) intForKey:(NSString*)key withDefault:(int)def
{
	NSNumber* num = [_paramSets[_currentSet] objectForKey:key];
	if (num) return [num intValue];
	
	// Need to register this as an unset parameter
	[_unsetKeys setObject:@"int" forKey:key];
	return def;
}

-(void) setInt:(int)val forKey:(NSString*)key
{
	int existing = [self intForKey:key withDefault:val];
	BOOL isNew = existing != val;
	
	[_paramSets[_currentSet] setObject:[NSNumber numberWithInt:val] forKey:key];
	
	if (isNew) [self sendParamChangeNotificationForKey:key];
}




-(NSString*) stringForKey:(NSString*)key withDefault:(NSString*)def
{
	NSString* str = [_paramSets[_currentSet] objectForKey:key];
	if (!str)
	{
		// Need to register this as an unset parameter
		[_unsetKeys setObject:@"string" forKey:key];
		return def;
	}
	
	
	if ([str isKindOfClass:[NSString class]]) 
	{
		return str;
	}
	else
	{
		if ([str respondsToSelector:@selector(stringValue)])
		{
			return [(id)str stringValue];
		}
		else
		{
			return [str description];
		}
	}
}


-(void) setString:(NSString*)val forKey:(NSString*)key
{
	NSString* existing = [self stringForKey:key withDefault:val];
	BOOL isNew = ![existing isEqual:val];
	[_paramSets[_currentSet] setObject:val forKey:key];
	
	if (isNew) [self sendParamChangeNotificationForKey:key];
}


-(void) setCurrentSet:(int)val
{
	BOOL isNew = val != _currentSet;
	
	_currentSet = val;
	
	if (isNew) 
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:PARMYLIB_PARAM_CHANGED object:nil];
	}
}


-(void) replaceParamSet:(int)set with:(NSDictionary*)dict
{
	set = MIN(MAX(0,set),9);
	
	_paramSets[set] = [dict mutableCopy];
}

-(NSArray*) allKeys
{
	// Just use set 0 assuming they are all the same ....
	return [_paramSets[0] allKeys];
}

-(id) objectInSet:(int)set forKey:(NSString*)key
{
	return [_paramSets[set] objectForKey:key];
}


-(void) bindName:(NSString*)key onto:(NSString*)pName ofObject:(NSObject*)obj
{
	NSMutableArray* array = (NSMutableArray*)[_bindings objectForKey:key];
	
	if (!array)
	{
		array = [NSMutableArray array];
		[_bindings setObject:array forKey:key];
	}
	
	[array addObject:[NSArray arrayWithObjects:obj, pName, nil]];
}



@end

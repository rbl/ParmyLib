/*
 *  ParmyLib.h
 *  ParmyLib
 *
 *  Created by Tom Seago on 7/16/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(ParmyLib)

@property (nonatomic, assign) double pfv;
@property (nonatomic, assign) int piv;
@property (nonatomic, assign) NSString* psv;

-(double) pfvd:(double)defaultValue;
-(int) pivd:(int)defaultValue;
-(NSString*) psvd:(NSString*)defaultValue;

@end


@interface NSDictionary(ParmyLib)

-(void) setParmyLibSet:(int)set;

@end


@interface ParmyLib : NSObject

+(void) addToWindow:(UIWindow*)window;
+(void) activateInWindow:(UIWindow*)window;
+(void) toggleInWindow:(UIWindow*)window;

@end


#define PARMYLIB_PARAM_CHANGED			@"PARMYLIB_PARAM_CHANGED"


#define PARMYLIB_CLIENT_SET_PARAMS		@"PARMYLIB_CLIENT_SET_PARAMS"
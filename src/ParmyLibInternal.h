//
//  ParmyLib.h
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ParmyMainSelector;

@interface ParmyLibInternal : NSObject 
{
	ParmyMainSelector* _mainSelector;
}

@property (nonatomic, retain) ParmyMainSelector* mainSelector;

+(ParmyLibInternal*) sharedInstance;

-(void) addToWindow:(UIWindow*)window;
-(void) activateInWindow:(UIWindow*)window;
-(void) toggleInWindow:(UIWindow*)window;


@end

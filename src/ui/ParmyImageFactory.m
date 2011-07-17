//
//  ParmyImageFactory.m
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyImageFactory.h"

#import "SynthesizeSingleton.h"

@implementation ParmyImageFactory

SYNTHESIZE_SINGLETON_FOR_CLASS(ParmyImageFactory)

-(UIImage*) leftCapsuleAtWidth:(double)width forState:(PImageState)state
{
	switch (state) {
		case PImageStateBase:
		case PImageStateBaseSelected:
			return [[UIImage imageNamed:@"Parmy-capsuleLeftBase.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];

		case PImageStatePressed:
		case PImageStatePressedSelected:
			return [[UIImage imageNamed:@"Parmy-capsuleLeftPressed.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
	}
	
	return nil;			
}

-(UIImage*) middleCapsuleAtWidth:(double)width forState:(PImageState)state
{
	switch (state) {
		case PImageStateBase:
		case PImageStateBaseSelected:
			return [UIImage imageNamed:@"Parmy-capsuleMiddleBase.png"];
			
		case PImageStatePressed:
		case PImageStatePressedSelected:
			return [UIImage imageNamed:@"Parmy-capsuleMiddlePressed.png"];
	}
	
	return nil;			
}

-(UIImage*) rightCapsuleAtWidth:(double)width forState:(PImageState)state
{
	switch (state) {
		case PImageStateBase:
		case PImageStateBaseSelected:
			return [[UIImage imageNamed:@"Parmy-capsuleRightBase.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
			
		case PImageStatePressed:
		case PImageStatePressedSelected:
			return [[UIImage imageNamed:@"Parmy-capsuleRightPressed.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
	}
	
	return nil;	
}

-(UIImage*) popoverFrame
{
	return [[UIImage imageNamed:@"Parmy-popoverFrame.png"] stretchableImageWithLeftCapWidth:25 topCapHeight:0];
}

-(UIImage*) popoverFrameNibPointedUp:(BOOL)pointedUp
{
	
	return pointedUp ? [UIImage imageNamed:@"Parmy-nibUp.png"] :  [UIImage imageNamed:@"Parmy-nibDown.png"];
}

@end

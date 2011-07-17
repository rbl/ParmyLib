//
//  ParmyPopover.h
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ParmyPopover;

@protocol ParmyPopoverDelegate <NSObject>
@optional
-(void) willPresentPopover:(ParmyPopover*)popover;
-(void) didPresentPopover:(ParmyPopover*)popover;

-(void) willHidePopover:(ParmyPopover*)popover;
-(void) didHidePopover:(ParmyPopover*)popover;

@end



@interface ParmyPopover : UIView <UIGestureRecognizerDelegate>
{
	UIView* _parent;
	UIImageView* _windowFrame;
	UIImageView* _windowNib;
	
	UIView* _view;
	
	id<ParmyPopoverDelegate> _delegate;
	
	float _width;
	float _height;
}

@property (nonatomic, assign) UIView *parent;
@property (nonatomic, retain) UIImageView *windowFrame;
@property (nonatomic, retain) UIImageView *windowNib;

@property (nonatomic, retain) UIView *view;

@property (nonatomic, assign) id<ParmyPopoverDelegate> delegate;

-(id) initOnView:(UIView*)parent;
-(void) present;
-(void) hidePopover;


@end

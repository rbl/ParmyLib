//
//  ParmyMainSelector.h
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ParmyPopover.h"
#import "ParmyParamSelectPopover.h"

@interface ParmyMainSelector : UIView <ParmyPopoverDelegate, ParmyParamSelectDelegate, UIGestureRecognizerDelegate>
{
	UIButton* _btnParam;
	UIButton* _btnA;
	UIButton* _btnB;
	UIButton* _btnGear;
	
	UIButton* _pressed;
	BOOL _gotLongPress;
	CGPoint _startCenter;
	
	UIView* _selectionIndicator;
	ParmyPopover* _popover;
}

@property (nonatomic, retain) UIButton *btnParam;
@property (nonatomic, retain) UIButton *btnA;
@property (nonatomic, retain) UIButton *btnB;
@property (nonatomic, retain) UIButton *btnGear;

@property (nonatomic, retain) UIView *selectionIndicator;

@property (nonatomic, retain) ParmyPopover *popover;

-(void) close;

@end

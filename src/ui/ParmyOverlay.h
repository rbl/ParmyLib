//
//  ParmyOverlay.h
//  NoNameLib
//
//  Created by Tom Seago on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ParmyMainSelector;

@interface ParmyOverlay : UIView {
	UIWindow* _window;
	ParmyMainSelector* _mainSelector;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ParmyMainSelector *mainSelector;

@end

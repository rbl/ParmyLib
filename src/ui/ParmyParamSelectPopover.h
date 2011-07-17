//
//  ParmyParamSelectPopover.h
//  NoNameLib
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ParmyPopover.h"

@protocol ParmyParamSelectDelegate

-(void) selectedParamKey:(NSString*)key;

@end


@interface ParmyParamSelectPopover : ParmyPopover <UITableViewDataSource, UITableViewDelegate> 
{
	NSArray* _paramKeys;
	
	UITableView* _tableView;
	
	id<ParmyParamSelectDelegate> _selectDelegate;
}

@property (nonatomic, retain) NSArray *paramKeys;

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, assign) id<ParmyParamSelectDelegate> selectDelegate;

@end

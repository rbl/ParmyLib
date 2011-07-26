#import "ParmyLib.h"

void DefineParmyParms()
{
	[[NSDictionary dictionaryWithObjectsAndKeys: 

	  [NSNumber numberWithFloat:1.5], @"rotation speed",
      [NSNumber numberWithFloat:10.0], @"corner radius",
	  [NSNumber numberWithFloat:2.0], @"scale",
		nil

	  ] setParmyLibSet:0];
}


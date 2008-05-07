#import "ObjectBinderInspector.h"

@implementation ObjectBinderInspector

-(NSString *)viewNibName {
	return @"ObjectBinderInspector";
}

-(BOOL)supportsMultipleObjectInspection {
	return NO; // unpleasant or not, there's not an easy good way to handle multiple object inspection here
}

// -(void)refresh {
// 	// Synchronize your inspector's content view with the currently selected objects.
// 	[super refresh];
// }

@end

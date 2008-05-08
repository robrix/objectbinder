#import "RXAtomValueTransformer.h"
#import "RXObjectBinderPlugin.h"

@implementation RXObjectBinderPlugin

// +(void)initialize {
// 	[NSValueTransformer setValueTransformer: [[[RXAtomValueTransformer alloc] init] autorelease] forName: @"RXAtomValueTransformer"];
// }

-(NSArray *)libraryNibNames {
	return [NSArray arrayWithObject: @"RXObjectBinderLibrary"];
}


-(NSArray *)requiredFrameworks {
	return [NSArray arrayWithObject: [NSBundle bundleWithIdentifier: @"org.garbagecollective.RXObjectBinder"]];
}

@end

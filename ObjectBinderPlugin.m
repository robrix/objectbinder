#import "AtomValueTransformer.h"
#import "ObjectBinderPlugin.h"

@implementation ObjectBinderPlugin

// +(void)initialize {
// 	[NSValueTransformer setValueTransformer: [[[AtomValueTransformer alloc] init] autorelease] forName: @"AtomValueTransformer"];
// }

-(NSArray *)libraryNibNames {
	return [NSArray arrayWithObject: @"ObjectBinderLibrary"];
}


-(NSArray *)requiredFrameworks {
	return [NSArray arrayWithObject: [NSBundle bundleWithIdentifier: @"org.garbagecollective.ObjectBinder"]];
}

@end

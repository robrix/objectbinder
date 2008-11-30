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
	return [NSArray arrayWithObject: [NSBundle bundleWithIdentifier: @"org.garbagecollective.RXObjectBinderFramework"]];
}

-(NSString *)label {
	return @"Object Binder";
}


-(NSView *)preferencesView {
	return [[[NSView alloc] initWithFrame: NSMakeRect(0, 0, 0, 0)] autorelease];
}

@end
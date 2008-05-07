#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <ObjectBinderFramework/ObjectBinder.h>
#import "ObjectBinderInspector.h"


@implementation ObjectBinder (ObjectBinder)

-(void)ibPopulateKeyPaths:(NSMutableDictionary *)keyPaths {
	[super ibPopulateKeyPaths: keyPaths];
	
	[[keyPaths objectForKey: IBAttributeKeyPaths] addObjectsFromArray: keys];
	[[keyPaths objectForKey: IBToOneRelationshipKeyPaths] addObject: @"representedObject"];
}

-(void)ibPopulateAttributeInspectorClasses:(NSMutableArray *)classes {
	[super ibPopulateAttributeInspectorClasses: classes];
	[classes addObject: [ObjectBinderInspector class]];
}


-(void)bind:(NSString *)binding toObject:(id)obj withKeyPath:(NSString *)keyPath options:(NSDictionary *)options {
	[super bind: binding toObject: obj withKeyPath: keyPath options: options];
}

-(void)unbind:(NSString *)binding {
	[super unbind: binding];
}

@end

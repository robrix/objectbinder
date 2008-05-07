// AtomValueTransformer.m
// Created by Rob Rix on 2008-05-03
// Copyright 2008 Monochrome Industries

#import "AtomValueTransformer.h"

@implementation AtomValue

@synthesize representedObject;

+(id)atomValueWithRepresentedObject:(id)r {
	AtomValue *instance = [[self alloc] init];
	instance.representedObject = r;
	return [instance autorelease];
}

-(id)init {
	if(self = [super init]) {
		self.representedObject = @"key";
		return self;
	}
	return nil;
}

-(void)dealloc {
	[representedObject release];
	[super dealloc];
}

@end


@implementation AtomValueTransformer

+(Class)transformedValueClass {
	return [NSMutableArray class];
}

+(BOOL)allowsReverseTransformation {
	return YES;
}


-(id)transformedValue:(id)value {
	NSMutableArray *wrappers = [NSMutableArray array];
	for(id atom in value) {
		[wrappers addObject: [AtomValue atomValueWithRepresentedObject: atom]];
	}
	return wrappers;
}

-(id)reverseTransformedValue:(id)value {
	NSMutableArray *atoms = [NSMutableArray array];
	for(AtomValue *wrapper in value) {
		[atoms addObject: wrapper.representedObject];
	}
	return atoms;
}

@end
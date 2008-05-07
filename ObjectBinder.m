// ObjectBinder.m
// Created by Rob Rix on 2008-05-02
// Copyright 2008 Rob Rix

#import "ObjectBinder.h"

@implementation ObjectBinder

@synthesize representedObject;

-(id)selection {
	return representedObject;
}

@synthesize keys;

-(id)init {
	keys = [[NSMutableArray alloc] init];
	return self;
}

-(void)dealloc {
	[representedObject release]; representedObject = nil;
	[keys release]; keys = nil;
	[super dealloc];
}


-(id)initWithCoder:(NSCoder *)decoder {
	if(self = [self init]) {
		self.representedObject = [decoder decodeObjectForKey: @"ObjectBinderRepresentedObject"];
		self.keys = [decoder decodeObjectForKey: @"ObjectBinderKeys"];
		return self;
	}
	return nil;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject: representedObject forKey: @"ObjectBinderRepresentedObject"];
	[encoder encodeObject: keys forKey: @"ObjectBinderKeys"];
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
	return [representedObject methodSignatureForSelector: aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation {
	[anInvocation invokeWithTarget: representedObject];
}

-(BOOL)respondsToSelector:(SEL)selector {
	return [super respondsToSelector: selector] || [representedObject respondsToSelector: selector];
}


-(id)valueForUndefinedKey:(NSString *)key {
	if([keys containsObject: key]) {
		return [[self representedObject] valueForKey: key];
	}
	return [super valueForUndefinedKey: key];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
	if([keys containsObject: key]) {
		return [[self representedObject] setValue: value forUndefinedKey: key];
	}
	return [super setValue: value forUndefinedKey: key];
}


-(id)copyWithZone:(NSZone *)zone {
	ObjectBinder *copy = [[ObjectBinder allocWithZone: zone] init];
	copy.representedObject = self.representedObject;
	copy.keys = self.keys;
	return copy;
}


-(void)setKeys:(NSArray *)k {
	[self willChangeValueForKey: @"keys"];
	[keys setArray: k];
	for(NSString *key in keys) {
		[[self class] exposeBinding: key];
	}
	[self didChangeValueForKey: @"keys"];
}

@end
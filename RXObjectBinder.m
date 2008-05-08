// RXObjectBinder.m
// Created by Rob Rix on 2008-05-02
// Copyright 2008 Rob Rix

#import "RXObjectBinder.h"

@implementation RXObjectBinder

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
		self.representedObject = [decoder decodeObjectForKey: @"RXObjectBinderRepresentedObject"];
		self.keys = [decoder decodeObjectForKey: @"RXObjectBinderKeys"];
		return self;
	}
	return nil;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject: representedObject forKey: @"RXObjectBinderRepresentedObject"];
	[encoder encodeObject: keys forKey: @"RXObjectBinderKeys"];
}


// -(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
// 	return [representedObject methodSignatureForSelector: aSelector];
// }
// 
// -(void)forwardInvocation:(NSInvocation *)anInvocation {
// 	[anInvocation invokeWithTarget: representedObject];
// }
// 
// -(BOOL)respondsToSelector:(SEL)selector {
// 	return [super respondsToSelector: selector] || [representedObject respondsToSelector: selector];
// }


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


-(void)bind:(NSString *)binding toObject:(id)obj withKeyPath:(NSString *)keyPath options:(NSDictionary *)options {
	[representedObject bind: binding toObject: obj withKeyPath: keyPath options: options];
}

-(void)unbind:(NSString *)binding {
	[representedObject unbind: binding];
}


-(id)copyWithZone:(NSZone *)zone {
	RXObjectBinder *copy = [[RXObjectBinder allocWithZone: zone] init];
	copy.representedObject = representedObject;
	copy.keys = self.keys;
	return copy;
}


-(void)setKeys:(NSArray *)k {
	[self willChangeValueForKey: @"keys"];
	[keys setArray: k];
	[self didChangeValueForKey: @"keys"];
}


-(NSArray *)exposedBindings {
	return [self keys];
}

@end
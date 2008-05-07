// AtomValueTransformer.h
// Created by Rob Rix on 2008-05-03
// Copyright 2008 Monochrome Industries

#import <Cocoa/Cocoa.h>

@interface AtomValue : NSObject {
	id representedObject;
}
@property (retain) id representedObject;
+(id)atomValueWithRepresentedObject:(id)r;
@end

@interface AtomValueTransformer : NSValueTransformer {}
@end
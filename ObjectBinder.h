// ObjectBinder.h
// Created by Rob Rix on 2008-05-02
// Copyright 2008 Rob Rix

#import <Foundation/Foundation.h>

@interface ObjectBinder : NSObject {
	id representedObject;
	NSMutableArray *keys;
}
@property (retain) id representedObject;
@property (copy) NSArray *keys;
@property (readonly) id selection;
@end
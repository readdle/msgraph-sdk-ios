// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphEvent;

@interface MSGraphEventCollection : MSCollection

+ (MSGraphEventCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphEvent*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

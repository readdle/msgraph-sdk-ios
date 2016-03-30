// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphDirectoryObject;

@interface MSGraphDirectoryObjectCollection : MSCollection

+ (MSGraphDirectoryObjectCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphDirectoryObject*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphThumbnailSet;

@interface MSGraphThumbnailSetCollection : MSCollection

+ (MSGraphThumbnailSetCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphThumbnailSet*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

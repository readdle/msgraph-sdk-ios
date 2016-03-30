// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphSubscribedSku;

@interface MSGraphSubscribedSkuCollection : MSCollection

+ (MSGraphSubscribedSkuCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphSubscribedSku*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

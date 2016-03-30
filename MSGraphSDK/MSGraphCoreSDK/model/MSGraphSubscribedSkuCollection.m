// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphSubscribedSkuCollection.h"
#import "MSGraphSubscribedSku.h"

@implementation MSGraphSubscribedSkuCollection

+ (MSGraphSubscribedSkuCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphSubscribedSkuCollection *col = [[MSGraphSubscribedSkuCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphSubscribedSku*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphSubscribedSku alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphProvisionedPlanCollection.h"
#import "MSGraphProvisionedPlan.h"

@implementation MSGraphProvisionedPlanCollection

+ (MSGraphProvisionedPlanCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphProvisionedPlanCollection *col = [[MSGraphProvisionedPlanCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphProvisionedPlan*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphProvisionedPlan alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end

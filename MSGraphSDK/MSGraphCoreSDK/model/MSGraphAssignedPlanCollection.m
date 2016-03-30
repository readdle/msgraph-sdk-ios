// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphAssignedPlanCollection.h"
#import "MSGraphAssignedPlan.h"

@implementation MSGraphAssignedPlanCollection

+ (MSGraphAssignedPlanCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphAssignedPlanCollection *col = [[MSGraphAssignedPlanCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphAssignedPlan*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphAssignedPlan alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end

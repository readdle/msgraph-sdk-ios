// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphServicePlanInfoCollection.h"
#import "MSGraphServicePlanInfo.h"

@implementation MSGraphServicePlanInfoCollection

+ (MSGraphServicePlanInfoCollection *) fromMSCollection:(MSCollection *)collection {
    MSGraphServicePlanInfoCollection *col = [[MSGraphServicePlanInfoCollection alloc] init];
    col.value = collection.value;
    col.nextLink = collection.nextLink;
    col.additionalData = collection.additionalData;
    return col;
}

- (MSGraphServicePlanInfo*) objectAtIndex:(NSUInteger)index {
    return [[MSGraphServicePlanInfo alloc] initWithDictionary: [super.value objectAtIndex:index] ];
    
}

- (NSUInteger) count {
    return [super.value count];
}

@end

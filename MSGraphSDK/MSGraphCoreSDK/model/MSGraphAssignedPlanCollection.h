// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphAssignedPlan;

@interface MSGraphAssignedPlanCollection : MSCollection

+ (MSGraphAssignedPlanCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphAssignedPlan*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphProvisionedPlan;

@interface MSGraphProvisionedPlanCollection : MSCollection

+ (MSGraphProvisionedPlanCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphProvisionedPlan*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

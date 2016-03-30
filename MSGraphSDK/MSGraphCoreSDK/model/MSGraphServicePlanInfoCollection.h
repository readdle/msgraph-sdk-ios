// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphServicePlanInfo;

@interface MSGraphServicePlanInfoCollection : MSCollection

+ (MSGraphServicePlanInfoCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphServicePlanInfo*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

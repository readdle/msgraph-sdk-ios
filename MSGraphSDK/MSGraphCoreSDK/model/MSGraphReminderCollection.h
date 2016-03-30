// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSCollection.h"
@class MSGraphReminder;

@interface MSGraphReminderCollection : MSCollection

+ (MSGraphReminderCollection *) fromMSCollection:(MSCollection *)collection;
- (MSGraphReminder*) objectAtIndex:(NSUInteger)index;
@property(readonly) NSUInteger count;

@end

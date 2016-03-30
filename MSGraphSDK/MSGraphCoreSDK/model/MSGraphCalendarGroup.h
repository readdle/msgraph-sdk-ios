// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphCalendar; 
#import "MSGraphCalendarCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphCalendarGroup : MSGraphEntity

  @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setClassId:, getter=classId) NSString* classId;
    @property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
    @property (nonatomic, setter=setCalendars:, getter=calendars) MSGraphCalendarCollection* calendars;
  - (MSGraphCalendar*) calendars:(NSInteger)index;

@end

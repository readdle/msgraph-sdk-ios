// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphEvent; 
#import "MSGraphCalendarColor.h"
#import "MSGraphEventCollection.h"


#import "MSGraphEntity.h"
#import "MSCollection.h"

@interface MSGraphCalendar : MSGraphEntity

  @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setColor:, getter=color) MSGraphCalendarColor color;
    @property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
    @property (nonatomic, setter=setEvents:, getter=events) MSGraphEventCollection* events;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) MSGraphEventCollection* calendarView;
  - (MSGraphEvent*) events:(NSInteger)index;
- (MSGraphEvent*) calendarView:(NSInteger)index;

@end

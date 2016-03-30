// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphCalendar()
{
    NSString* _name;
    MSGraphCalendarColor _color;
    NSString* _changeKey;
    MSGraphEventCollection* _events;
    MSGraphEventCollection* _calendarView;
}
@end

@implementation MSGraphCalendar

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.calendar";
    }
    return self;
}
- (NSString*) name
{
    return self.dictionary[@"name"];
}
- (void) setName: (NSString*) val
{
    self.dictionary[@"name"] = val;
}
- (MSGraphCalendarColor) color
{
    _color = [self.dictionary[@"color"] toMSGraphCalendarColor];
    return _color;
}
- (void) setColor: (MSGraphCalendarColor) val
{
    _color = val;
    self.dictionary[@"color"] = [NSString stringWithMSGraphCalendarColor:val];
}
- (NSString*) changeKey
{
    return self.dictionary[@"changeKey"];
}
- (void) setChangeKey: (NSString*) val
{
    self.dictionary[@"changeKey"] = val;
}
- (MSGraphEventCollection*) events
{
    if(!_events){
        
    NSMutableArray *eventsCollection = [NSMutableArray array];
    NSArray *eventss = self.dictionary[@"events"];

    if ([eventss isKindOfClass:[NSArray class]]){
        for (id events in eventss){
            [eventsCollection addObject:events];
         }
    }

    if ([eventsCollection count] > 0){
        _events = [[MSGraphEventCollection alloc] initWithArray:eventsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _events;
}
- (void) setEvents: (MSGraphEventCollection*) val
{
    _events = val;
    self.dictionary[@"events"] = val;
}
- (MSGraphEventCollection*) calendarView
{
    if(!_calendarView){
        
    NSMutableArray *calendarViewCollection = [NSMutableArray array];
    NSArray *calendarViews = self.dictionary[@"calendarView"];

    if ([calendarViews isKindOfClass:[NSArray class]]){
        for (id calendarView in calendarViews){
            [calendarViewCollection addObject:calendarView];
         }
    }

    if ([calendarViewCollection count] > 0){
        _calendarView = [[MSGraphEventCollection alloc] initWithArray:calendarViewCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _calendarView;
}
- (void) setCalendarView: (MSGraphEventCollection*) val
{
    _calendarView = val;
    self.dictionary[@"calendarView"] = val;
}
- (MSGraphEvent*) events:(NSInteger)index
{
   MSGraphEvent* events = nil;
   if (self.events.value){
       events = self.events.value[index];
   }
   return events;
}
- (MSGraphEvent*) calendarView:(NSInteger)index
{
   MSGraphEvent* calendarView = nil;
   if (self.calendarView.value){
       calendarView = self.calendarView.value[index];
   }
   return calendarView;
}

@end

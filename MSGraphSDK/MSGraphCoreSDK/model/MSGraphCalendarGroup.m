// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphCalendarGroup()
{
    NSString* _name;
    NSString* _classId;
    NSString* _changeKey;
    MSGraphCalendarCollection* _calendars;
}
@end

@implementation MSGraphCalendarGroup

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.calendarGroup";
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
- (NSString*) classId
{
    return self.dictionary[@"classId"];
}
- (void) setClassId: (NSString*) val
{
    self.dictionary[@"classId"] = val;
}
- (NSString*) changeKey
{
    return self.dictionary[@"changeKey"];
}
- (void) setChangeKey: (NSString*) val
{
    self.dictionary[@"changeKey"] = val;
}
- (MSGraphCalendarCollection*) calendars
{
    if(!_calendars){
        
    NSMutableArray *calendarsCollection = [NSMutableArray array];
    NSArray *calendarss = self.dictionary[@"calendars"];

    if ([calendarss isKindOfClass:[NSArray class]]){
        for (id calendars in calendarss){
            [calendarsCollection addObject:calendars];
         }
    }

    if ([calendarsCollection count] > 0){
        _calendars = [[MSGraphCalendarCollection alloc] initWithArray:calendarsCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    }
    return _calendars;
}
- (void) setCalendars: (MSGraphCalendarCollection*) val
{
    _calendars = val;
    self.dictionary[@"calendars"] = val;
}
- (MSGraphCalendar*) calendars:(NSInteger)index
{
   MSGraphCalendar* calendars = nil;
   if (self.calendars.value){
       calendars = self.calendars.value[index];
   }
   return calendars;
}

@end

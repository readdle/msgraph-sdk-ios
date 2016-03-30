// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphRecurrencePattern()
{
    MSGraphRecurrencePatternType _type;
    int32_t _interval;
    int32_t _month;
    int32_t _dayOfMonth;
    MSGraphDayOfWeekCollection* _daysOfWeek;
    MSGraphDayOfWeek _firstDayOfWeek;
    MSGraphWeekIndex _index;
}
@end

@implementation MSGraphRecurrencePattern

- (MSGraphRecurrencePatternType) type
{
    _type = [self.dictionary[@"type"] toMSGraphRecurrencePatternType];
    return _type;
}
- (void) setType: (MSGraphRecurrencePatternType) val
{
    _type = val;
    self.dictionary[@"type"] = [NSString stringWithMSGraphRecurrencePatternType:val];
}
- (int32_t) interval
{
    _interval = [self.dictionary[@"interval"] intValue];
    return _interval;
}
- (void) setInterval: (int32_t) val
{
    _interval = val;
    self.dictionary[@"interval"] = @(val);
}
- (int32_t) month
{
    _month = [self.dictionary[@"month"] intValue];
    return _month;
}
- (void) setMonth: (int32_t) val
{
    _month = val;
    self.dictionary[@"month"] = @(val);
}
- (int32_t) dayOfMonth
{
    _dayOfMonth = [self.dictionary[@"dayOfMonth"] intValue];
    return _dayOfMonth;
}
- (void) setDayOfMonth: (int32_t) val
{
    _dayOfMonth = val;
    self.dictionary[@"dayOfMonth"] = @(val);
}
- (MSGraphDayOfWeekCollection*) daysOfWeek
{
    
    NSMutableArray *daysOfWeekCollection = [NSMutableArray array];
    NSArray *daysOfWeeks = self.dictionary[@"daysOfWeek"];

    if ([daysOfWeeks isKindOfClass:[NSArray class]]){
        for (id daysOfWeek in daysOfWeeks){
            [daysOfWeekCollection addObject:daysOfWeek];
         }
    }

    if ([daysOfWeekCollection count] > 0){
        _daysOfWeek = [[MSGraphDayOfWeekCollection alloc] initWithArray:daysOfWeekCollection nextLink:self.dictionary[@"@nextLink"] additionalData:self.dictionary];
    }
        
    return _daysOfWeek;
}
- (void) setDaysOfWeek: (MSGraphDayOfWeekCollection*) val
{
    _daysOfWeek = val;
    self.dictionary[@"daysOfWeek"] = val;
}
- (MSGraphDayOfWeek) firstDayOfWeek
{
    _firstDayOfWeek = [self.dictionary[@"firstDayOfWeek"] toMSGraphDayOfWeek];
    return _firstDayOfWeek;
}
- (void) setFirstDayOfWeek: (MSGraphDayOfWeek) val
{
    _firstDayOfWeek = val;
    self.dictionary[@"firstDayOfWeek"] = [NSString stringWithMSGraphDayOfWeek:val];
}
- (MSGraphWeekIndex) index
{
    _index = [self.dictionary[@"index"] toMSGraphWeekIndex];
    return _index;
}
- (void) setIndex: (MSGraphWeekIndex) val
{
    _index = val;
    self.dictionary[@"index"] = [NSString stringWithMSGraphWeekIndex:val];
}
@end

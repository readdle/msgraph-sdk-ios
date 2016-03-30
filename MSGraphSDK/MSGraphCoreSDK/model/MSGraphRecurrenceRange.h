// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


#import "MSGraphRecurrenceRangeType.h"


#import "MSObject.h"
#import "MSCollection.h"

@interface MSGraphRecurrenceRange : MSObject

	@property (nonatomic, setter=setType:, getter=type) MSGraphRecurrenceRangeType type;
		@property (nonatomic, setter=setStartDate:, getter=startDate) NSDate* startDate;
		@property (nonatomic, setter=setEndDate:, getter=endDate) NSDate* endDate;
		@property (nonatomic, setter=setRecurrenceTimeZone:, getter=recurrenceTimeZone) NSString* recurrenceTimeZone;
		@property (nonatomic, setter=setNumberOfOccurrences:, getter=numberOfOccurrences) int32_t numberOfOccurrences;
	
@end

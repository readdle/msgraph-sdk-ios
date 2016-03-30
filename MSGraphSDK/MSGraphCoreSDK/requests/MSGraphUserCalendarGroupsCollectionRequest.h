// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphCalendarGroupCollection.h"

@class MSGraphCalendarGroupRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphCalendarGroupCompletionHandler)(MSGraphCalendarGroup *response, NSError *error);

typedef void (^MSGraphUserCalendarGroupsCollectionCompletionHandler)(MSGraphCalendarGroupCollection* response, MSGraphUserCalendarGroupsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserCalendarGroupsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserCalendarGroupsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addCalendarGroup:(MSGraphCalendarGroup*)calendarGroup withCompletion:(MSGraphCalendarGroupCompletionHandler)completionHandler;

@end

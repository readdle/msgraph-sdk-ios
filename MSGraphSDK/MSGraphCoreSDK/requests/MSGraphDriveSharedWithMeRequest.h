// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;

#import "MSCollectionRequest.h"
#import "MSGraphDriveItemCollection.h"

@interface MSGraphDriveSharedWithMeRequest : MSCollectionRequest

@property (readonly) NSMutableURLRequest *mutableRequest;


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphDriveItemCollection *response, MSGraphDriveSharedWithMeRequest *nextRequest, NSError *error))completionHandler;

@end

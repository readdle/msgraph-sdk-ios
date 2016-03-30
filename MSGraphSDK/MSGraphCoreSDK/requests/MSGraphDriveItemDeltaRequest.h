// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;

#import "MSCollectionRequest.h"
#import "MSGraphDriveItemCollection.h"

@interface MSGraphDriveItemDeltaRequest : MSCollectionRequest

@property (readonly) NSMutableURLRequest *mutableRequest;


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphDriveItemCollection *response, MSGraphDriveItemDeltaRequest *nextRequest, NSError *error))completionHandler;

@end

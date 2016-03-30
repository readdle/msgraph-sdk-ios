// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDriveCollection.h"

@class MSGraphDriveRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDriveCompletionHandler)(MSGraphDrive *response, NSError *error);

typedef void (^MSGraphDrivesCollectionCompletionHandler)(MSGraphDriveCollection* response, MSGraphDrivesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDrivesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDrivesCollectionCompletionHandler)completionHandler;
@end

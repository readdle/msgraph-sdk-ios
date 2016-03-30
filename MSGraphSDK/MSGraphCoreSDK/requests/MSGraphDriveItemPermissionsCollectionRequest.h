// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphPermissionCollection.h"

@class MSGraphPermissionRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphPermissionCompletionHandler)(MSGraphPermission *response, NSError *error);

typedef void (^MSGraphDriveItemPermissionsCollectionCompletionHandler)(MSGraphPermissionCollection* response, MSGraphDriveItemPermissionsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDriveItemPermissionsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDriveItemPermissionsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addPermission:(MSGraphPermission*)permission withCompletion:(MSGraphPermissionCompletionHandler)completionHandler;

@end

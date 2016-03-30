// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphDirectoryObjectCollection.h"

@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphUserOwnedDevicesCollectionWithReferencesCompletionHandler)(MSGraphDirectoryObjectCollection* response, MSGraphUserOwnedDevicesCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphUserOwnedDevicesCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserOwnedDevicesCollectionWithReferencesCompletionHandler)completionHandler;
@end

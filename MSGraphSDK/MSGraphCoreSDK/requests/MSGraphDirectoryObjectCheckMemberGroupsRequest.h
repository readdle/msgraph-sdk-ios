// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;

#import "MSCollectionRequest.h"
#import "MSGraphStringCollection.h"

@interface MSGraphDirectoryObjectCheckMemberGroupsRequest : MSCollectionRequest

@property (readonly) NSMutableURLRequest *mutableRequest;

- (instancetype)initWithGroupIds:(NSArray *)groupIds URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client;

- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphStringCollection *response, MSGraphDirectoryObjectCheckMemberGroupsRequest *nextRequest, NSError *error))completionHandler;

@end

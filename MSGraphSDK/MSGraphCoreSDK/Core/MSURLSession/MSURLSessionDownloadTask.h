// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionProgressTask.h"

/**
 An MSURLSessionTask to be used for downloading content.
 @see MSURLSessionTask
 */
@interface MSURLSessionDownloadTask : MSURLSessionProgressTask

/**
 Creates a Download task with the given request and client.
 @param request The mutableURL request. Must not be nil.
 @param client The client that will send the request. Must not be nil.
 @param completionHandler The completion handler to call when the task has completed.
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
             completionHandler:(MSDownloadCompletionHandler)completionHandler;

/**
 Creates a Download task with the given request and client.
 @param request The mutableURL request. Must not be nil.
 @param client The client that will send the request. Must not be nil.
 @param skipAuthentication The parameter, indicating whether authentication should be skipped
 @param  skipHeadersInheritance The parameter, indicating whether http headers inheirtance during redirect should be skipped
 @param completionHandler The completion handler to call when the task has completed.
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
             skipAuthentication:(BOOL)skipAuthentication
         skipHeadersInheritance:(BOOL)skipHeadersInheritance
              completionHandler:(MSDownloadCompletionHandler)completionHandler;

@end

//
//  MSGraphTestCase.h
//  MSGraphSDK
//
//  Created by canviz on 5/28/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "MSGraphSDK.h"
#import "OCMock.h"


@interface MSURLSessionTask()
- (NSURLSessionTask *)taskWithRequest:(NSMutableURLRequest*)request;
@end

@interface MSGraphTestCase : XCTestCase
@property NSMutableURLRequest *testRequest;
@property NSURL *testBaseURL;
@property id<MSAuthenticationProvider> mockAuthProvider;
@property id<MSHttpProvider> mockHttpProvider;
@property ODataBaseClient *mockClient;

/**
 * Sets the mock auth manager to call the appendAuthHeaders completion
 *  handler with the given request and error
 *  @param mockAuthManager, the mock auth manager to set
 *  @param request, the request to pass back in the completion handler
 *  @param error, the error to pass back in the completion handler
 *  @warning mockAuthManager must not be nil
 */
- (void) setAuthProvider:(id <MSAuthenticationProvider> )mockAuthManager
appendHeaderResponseWith:(NSMutableURLRequest *)request
                   error:(NSError *)error;


/**
 * Sets the mock ODHttpProvider to call the  dataTaskWithCompletionHandler
 *  completion handler with the given data, response, and error
 *  @param mockSession the mock session to stub out
 *  @param data the data to be passed into the completion handler
 *  @param response, the response to be passed into the completion handler
 *  @param error the error to be passed into the completion handler
 *  @warning mockSession must not be nil
 */
- (OCMStubRecorder *) mockURLSession:( id <MSHttpProvider> )mockSession
       dataTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                data:(NSData *)data
                            response:(NSHTTPURLResponse *)response
                               error:(NSError *)error;

- (OCMStubRecorder *) mockURLSession:( id <MSHttpProvider> )mockSession
       dataTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                data:(NSData *)data
                            response:(NSHTTPURLResponse *)response
                               error:(NSError *)error
                            dataTask:(NSURLSessionDataTask *)task;

/**
 * Sets the mockSession to call the dataTaskWithCompletionHandler
 * with the given, data , response, and error
 * @see mockURLSession: dataTaskCompletionWithRequest: data:response:error
 */
-(OCMStubRecorder *) dataTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                              data:(NSData *)data
                                          response:(NSHTTPURLResponse *)response
                                             error:(NSError *)error;

-(OCMStubRecorder *) dataTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                              data:(NSData *)data
                                          response:(NSHTTPURLResponse *)response
                                             error:(NSError *)error
                                          dataTask:(NSURLSessionDataTask *)task;

- (OCMStubRecorder *)downloadTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                              progress:(NSProgress *)progress
                                                   url:(NSURL *)location
                                              response:(NSHTTPURLResponse *)response
                                                 error:(NSError *)error;

- (OCMStubRecorder *)downloadTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                              progress:(NSProgress *)progress
                                                   url:(NSURL *)location
                                              response:(NSHTTPURLResponse *)response
                                                 error:(NSError *)error
                                          downloadTask:(NSURLSessionDownloadTask *)task;

- (OCMStubRecorder *) mockURLSession:(id <MSHttpProvider> )mockSession
   downloadTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                            progress:(NSProgress *)progress
                                 url:(NSURL *)location
                            response:(NSHTTPURLResponse *)response
                               error:(NSError *)error
                        downloadTask:(NSURLSessionDownloadTask *)task;

- (OCMStubRecorder *) mockURLSession:(id <MSHttpProvider> )mockSession
   downloadTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                            progress:(NSProgress *)progress
                                 url:(NSURL *)location
                            response:(NSHTTPURLResponse *)response
                               error:(NSError *)error;


- (OCMStubRecorder *)uploadTaskFromDataCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                                    progress:(NSProgress *)progress
                                                    responseData:(NSData *)responseData
                                                    response:(NSHTTPURLResponse *)response
                                                       error:(NSError *)error;
- (OCMStubRecorder *)uploadTaskFromFileURLCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                                                       progress:(NSProgress *)progress
                                                        fileURL:(NSURL *)fileURL
                                                   responseData:(NSData *)responseData
                                                    response:(NSHTTPURLResponse *)response
                                                       error:(NSError *)error;

- (OCMStubRecorder *) mockURLSession:(id <MSHttpProvider> )mockSession
     uploadTaskCompletionWithRequest:(NSMutableURLRequest *)mockRequest
                            progress:(NSProgress *)progress
                                data:(NSData *)data
                            response:(NSHTTPURLResponse *)response
                               error:(NSError *)error
                          uploadTask:(NSURLSessionUploadTask *)task;

@end
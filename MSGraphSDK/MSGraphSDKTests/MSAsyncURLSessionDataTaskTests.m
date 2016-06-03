//
//  MSAsyncURLSessionDataTaskTests.m
//  MSGraphSDK
//
//  Created by canviz on 5/31/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphTestCase.h"

@interface MSAsyncURLSessionDataTaskTests : MSGraphTestCase

@end

@implementation MSAsyncURLSessionDataTaskTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMSAsyncURLSessionDataTaskErrorOnCreation{
    __block NSError *mockError = [NSError errorWithDomain:MSErrorDomain code:MSClientErrorCodeBadRequest userInfo:@{}];
    [self mockURLSession:self.mockHttpProvider dataTaskCompletionWithRequest:self.testRequest data:nil response:nil error:mockError];
    
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(id response, MSAsyncOperationStatus *status, NSError *error){
        XCTAssertNil(response);
        XCTAssertNil(status);
        XCTAssertEqual(mockError, error);
    }];
    
    [asyncTask taskWithRequest:self.testRequest];
}

- (void)testMSAsyncURLSessionDataTaskClientErrorOnCreation{
    __block NSHTTPURLResponse *notFoundResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSClientErrorCodeNotFound HTTPVersion:@"foO" headerFields:@{}];
    __block NSDictionary *userInfo = @{ @"foo" : @"Bar"};
    __block NSData *responseData = [NSJSONSerialization dataWithJSONObject:userInfo  options:0 error:nil];
    
    [self mockURLSession:self.mockHttpProvider dataTaskCompletionWithRequest:self.testRequest data:responseData response:notFoundResponse error:nil];
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(id response, MSAsyncOperationStatus *status, NSError *error){
        XCTAssertNil(response);
        XCTAssertNil(status);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, MSClientErrorCodeNotFound);
        XCTAssertNotNil([error clientError]);
        XCTAssertTrue([[error clientError] matches:MSMalformedErrorResponseError]);
    }];
    [asyncTask taskWithRequest:self.testRequest];
}

- (void)testMSAsyncURLSessionDataTaskServiceUnknownResponse{
    __block NSHTTPURLResponse *notModified = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesNotModified HTTPVersion:@"foO" headerFields:@{}];
    
    [self mockURLSession:self.mockHttpProvider dataTaskCompletionWithRequest:self.testRequest data:nil response:notModified error:nil];
    
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(id response, MSAsyncOperationStatus *status, NSError *error){
        XCTAssertNil(response);
        XCTAssertNil(status);
        //    XCTAssertEqual(error.code, ODUnexpectedResponse);
    }];
    
    [asyncTask taskWithRequest:self.testRequest];
}

- (void)testMSAsyncURLSessionDataTaskValidAsyncSessionCreated{
    __block NSHTTPURLResponse *accepted = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesAccepted HTTPVersion:@"foo" headerFields:@{ @"Location" : [self.testBaseURL absoluteString]}];
    
    
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:nil];
    MSAsyncURLSessionDataTask *mockTask = OCMPartialMock(asyncTask);
    OCMStub([mockTask sendMonitorRequest:[OCMArg any]]);
    [mockTask onRequestStarted:accepted error:nil];
    OCMVerify([mockTask sendMonitorRequest:[OCMArg checkWithBlock:^(NSMutableURLRequest *request){
        return [[request.URL absoluteString] isEqualToString:[self.testBaseURL absoluteString]];
    }]]);
}

- (void)testMSAsyncURLSessionDataTaskOnMonitorRequestError{
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient];
    __block NSError *unknownError = [NSError errorWithDomain:MSErrorDomain code:MSClientErrorCodeUnknownError userInfo:@{}];
    
    asyncTask.asyncActionCompletion = ^(NSDictionary *response, MSAsyncOperationStatus *status, NSError *error){
        XCTAssertNil(response);
        XCTAssertNil(status);
        XCTAssertEqual(error, unknownError);
    };
    
    [asyncTask onMonitorRequestResponse:nil httpResponse:nil error:unknownError];
}

- (void)testMSAsyncURLSessionDataTaskValidItemReturned{
    __block NSDictionary *responseDict = @{@"foo":@"bar"};
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesOK HTTPVersion:@"foo" headerFields:nil];
    
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc]
                                            initWithRequest:self.testRequest
                                            client:self.mockClient
                                            completion:^(NSDictionary *dictionary, MSAsyncOperationStatus *status, NSError *error){
                                                XCTAssertNil(status);
                                                XCTAssertNil(error);
                                                XCTAssertNotNil(dictionary);
                                                XCTAssert([[dictionary objectForKey:@"foo"] isEqualToString:@"bar"]);
                                                                                   }];
    [asyncTask onMonitorRequestResponse:responseDict httpResponse:response error:nil];
    XCTAssertEqual(asyncTask.progress.completedUnitCount, 100);
    XCTAssertEqual(asyncTask.state, MSURLSessionTaskStateTaskCompleted);
}

- (void)testMSAsyncURLSessionDataTaskInvalidResponse{
    MSAsyncURLSessionDataTask *asyncTask = [[MSAsyncURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(NSDictionary *resposne, MSAsyncOperationStatus *status, NSError *error){
        XCTAssertNotNil(error);
    }];
    
    NSHTTPURLResponse *badResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:42 HTTPVersion:@"foo" headerFields:@{}];
    [asyncTask onMonitorRequestResponse:nil httpResponse:badResponse error:nil];
}

@end

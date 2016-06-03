//
//  MSURLSessionDataTask.m
//  MSGraphSDK
//
//  Created by canviz on 5/30/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphTestCase.h"


@interface MSURLSessionDataTaskTests : MSGraphTestCase

@end

@implementation MSURLSessionDataTaskTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}
/**
 ** Test  [MSURLSessionDataTask init]
 **
 */
- (void)testMSURLSessionDataTaskInit{
    XCTAssertThrows([[MSURLSessionDataTask alloc] initWithRequest:nil client:self.mockClient completion:^(NSDictionary *dictionary, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:nil completion:^(NSDictionary *dictionary, NSError *error) {
    }]);
    MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion: nil];
    XCTAssertNotNil(dataTask);
}
/**
 ** Test  [MSURLSessionDataTask execute]
 ** AuthError + Completion nil
 **
 */
- (void)testDataTaskAuthFailedWithoutCompletion{
    __block NSError *authError = [NSError errorWithDomain:@"authError" code:123 userInfo:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:nil error:authError];
    MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:nil];
    XCTAssertNoThrow([dataTask execute]);
}
/**
 Test MSURLSessionDataTask with Failed Auth
 */
- (void)testMSURLSessionDataTaskFailedAuth {
    __block NSError *authError = [NSError errorWithDomain:@"autherror" code:123 userInfo:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:nil error:authError];
    __block MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(NSDictionary *request, NSError *error){
        XCTAssertEqual(authError, error);
    }];
    XCTAssertEqual(dataTask.state, MSURLSessionTaskStateTaskCreated);
    [dataTask execute];
    XCTAssertEqual(dataTask.state, MSURLSessionTaskStateTaskAuthFailed);
}

/**
 ** Test  [MSURLSessionDataTask execute]
 ** Verify [NSURLSessionDataTask resume]
 ** Verify [MSURLSessionDataTask taskWithRequest]
 ** Verify [MSURLSessionDataTask state]
 */
- (void)testMSURLSessionDataTaskDidStart{
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    
    id mockNSTask = OCMClassMock([NSURLSessionDataTask class]);
    
    __block MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:nil];
    
    MSURLSessionDataTask *mockMSDataTask = OCMPartialMock(dataTask);
    OCMStub([mockMSDataTask taskWithRequest:[OCMArg any]])
    .andReturn(mockNSTask);
    
    
    OCMStub([mockNSTask resume])
    .andDo(^(NSInvocation *invocation){
    });
    
    [mockMSDataTask execute];
    XCTAssertEqual(mockMSDataTask.state, MSURLSessionTaskStateTaskExecuting);
    OCMVerify([mockNSTask resume]);
    OCMVerify([mockMSDataTask taskWithRequest:[OCMArg any]]);
    [mockNSTask stopMocking];
}
/**
 ** Test  [MSURLSessionDataTask dataTaskWithRequest], and connection error
 ** Verify [MSHttpProvider dataTaskWithRequest]
 ** Verify Response nil and Error
 */
- (void)testMSURLSessionDataTaskWithConnectionError{
    __block NSError *connectionError = [NSError errorWithDomain:@"connectionError" code:123 userInfo:@{}];
    self.testRequest.HTTPMethod = @"PUT";
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:nil response:nil error:connectionError];
    
    MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(NSDictionary *response, NSError *error){
        XCTAssertNil(response);
        XCTAssertEqual(error, connectionError);
    }];
    
    [dataTask execute];
    XCTAssertNotNil(self.testRequest.allHTTPHeaderFields[@"Content-Type"]);
    OCMVerify([self.mockHttpProvider dataTaskWithRequest:self.testRequest completionHandler:[OCMArg any]]);
}
/**
 ** Test  [MSURLSessionDataTask dataTaskWithRequest], and connection error
 ** Verify [MSHttpProvider dataTaskWithRequest]
 ** Verify Response nil and Error
 */
- (void)testMSURLSessionDataTaskWithNoCompletionHandler{
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:nil response:nil error:nil];
    MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:nil];
    
    XCTAssertNoThrow([dataTask execute]);
    OCMVerify([self.mockHttpProvider dataTaskWithRequest:self.testRequest completionHandler:[OCMArg any]]);
}
/**
 ** Test  [MSURLSessionDataTask dataTaskWithRequest], mock response and response data
 ** Verify Response Data
 */
- (void)testMSURLSessionDataTaskCompletionHandlerWithValidResponse{
    NSDictionary *responseBody = @{@"foo" : @"bar" };
    __block NSData *responseData = [NSJSONSerialization dataWithJSONObject:responseBody options:0 error:nil];
    __block NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:200 HTTPVersion:@"foo" headerFields:nil];
    
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:responseData response:response error:nil];
    
    __block MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(NSDictionary *responseDict, NSError *error){
        XCTAssertNil(error);
        XCTAssertEqual([responseDict count], 1);
        XCTAssertTrue([[responseDict objectForKey:@"foo"] isEqualToString:@"bar"]);
    }];
    
    [dataTask execute];
    XCTAssertEqual(dataTask.state, MSURLSessionTaskStateTaskCompleted);
}
/**
 ** Test  [MSURLSessionDataTask dataTaskWithRequest], mock response
 ** Verify Response status code 401
 */
- (void)testMSURLSessionDataTaskCompletionHandlerWith401Response{
    __block NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:401 HTTPVersion:@"foo" headerFields:nil];
    
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:nil response:response error:nil];
    
    MSURLSessionDataTask *dataTask = [[MSURLSessionDataTask alloc] initWithRequest:self.testRequest client:self.mockClient completion:^(NSDictionary *responseDict, NSError *error){
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, 401);
        XCTAssertNil(responseDict);
    }];
    
    [dataTask execute];
    XCTAssertEqual(dataTask.state, MSURLSessionTaskStateTaskCompleted);
}
@end

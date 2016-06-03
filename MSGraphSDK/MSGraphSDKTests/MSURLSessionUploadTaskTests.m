//
//  MSURLSessionUploadTaskTests.m
//  MSGraphSDK
//
//  Created by canviz on 5/31/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphTestCase.h"

@interface MSURLSessionUploadTaskTests : MSGraphTestCase
@property NSData * demoData;
@property NSURL *demoFileLocation;

@end

@implementation MSURLSessionUploadTaskTests

- (void)setUp {
    [super setUp];
    _demoData = [NSJSONSerialization dataWithJSONObject:@{@"initKey":@"initData"} options:0 error:nil];
    _demoFileLocation = [NSURL URLWithString:@"foo/bar/baz"];
}

- (void)tearDown {
    [super tearDown];
}
/**
 ** Test  [MSURLSessionUploadTask init]
 **
 */
- (void)testMSURLSessionUploadTaskInit{
    
    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:nil data:_demoData client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest data:nil client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest data:_demoData client:nil completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    

    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:nil fromFile:_demoFileLocation client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest fromFile:nil client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest fromFile:_demoFileLocation client:nil completionHandler:^(NSDictionary *response, NSError *error) {
    }]);
    
    
    MSURLSessionUploadTask *uploadTask  = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest data:_demoData client:self.mockClient completionHandler:nil];
    MSURLSessionUploadTask *uploadTaskFromFile  = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest fromFile:_demoFileLocation client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
    }];
    XCTAssertNotNil(uploadTask);
    XCTAssertNotNil(uploadTaskFromFile);
}

/**
 ** Test MSURLSessionUploadTask with Failed Auth
 ** Test [MSURLSessionUploadTask execute];
 */
- (void)testMSURLSessionUploadTaskFromFileFailedAuth {
    __block NSError *authError = [NSError errorWithDomain:@"autherror" code:123 userInfo:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:nil error:authError];
    
    __block MSURLSessionUploadTask *uploadTask = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest fromFile:self.demoFileLocation client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNotNil(error);
        XCTAssertEqual(error, authError);
    }];
    
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCreated);
    [uploadTask execute];
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskAuthFailed);
}
/**
 ** Test MSURLSessionUploadTask  From Data valid Response
 ** Test [MSURLSessionUploadTask execute];
 */
- (void)testMSURLSessionUploadTaskWithData {
    __block NSHTTPURLResponse *validResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:200 HTTPVersion:@"foo" headerFields:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self uploadTaskFromDataCompletionWithRequest:self.testRequest progress:nil responseData:self.demoData response:validResponse error:nil];
    __block MSURLSessionUploadTask *uploadTask = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest data:self.demoData client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(response);
    }];
    
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCreated);
    [uploadTask execute];
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCompleted);
}

/**
 ** Test MSURLSessionUploadTask  From fileURL valid Response
 ** Test [MSURLSessionUploadTask execute];
 */
- (void)testMSURLSessionUploadTaskWithFileURL {
    __block NSHTTPURLResponse *validResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:200 HTTPVersion:@"foo" headerFields:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:self.testRequest error:nil];
    [self uploadTaskFromFileURLCompletionWithRequest:self.testRequest progress:nil fileURL:self.demoFileLocation responseData:nil response:validResponse error:nil];
    __block MSURLSessionUploadTask *uploadTask = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest fromFile:self.demoFileLocation client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNil(response);
    }];
    
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCreated);
    [uploadTask execute];
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCompleted);
}
/**
 ** Test MSURLSessionUploadTask, connection error 404
 ** Test [MSURLSessionUploadTask execute];
 */
- (void)testMSURLSessionUploadTaskWith404{
    __block NSHTTPURLResponse *notFound = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:404 HTTPVersion:@"foo" headerFields:nil];
    
    [self uploadTaskFromDataCompletionWithRequest:self.testRequest progress:nil responseData:self.demoData response:notFound error:nil];
    
    MSURLSessionUploadTask *uploadTask = [[MSURLSessionUploadTask alloc] initWithRequest:self.testRequest data:self.demoData client:self.mockClient completionHandler:^(NSDictionary *response, NSError *error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(error.domain, MSErrorDomain);
        XCTAssertEqual(error.code, 404);
    }];
    
    [uploadTask taskWithRequest:self.testRequest];
    XCTAssertEqual(uploadTask.state, MSURLSessionTaskStateTaskCompleted);
}
@end

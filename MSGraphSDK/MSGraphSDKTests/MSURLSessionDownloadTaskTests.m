//
//  MSURLSessionDownloadTaskTests.m
//  MSGraphSDK
//
//  Created by canviz on 5/31/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphTestCase.h"


@interface MSURLSessionDownloadTaskTests : MSGraphTestCase

@end

@implementation MSURLSessionDownloadTaskTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 ** Test  [MSURLSessionDownloadTask init]
 **
 */
- (void)testMSURLSessionDownloadTaskInit{
    XCTAssertThrows([[MSURLSessionDownloadTask alloc] initWithRequest:nil client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
    }]);
    XCTAssertThrows([[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:nil completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
    }]);
    
    MSURLSessionDownloadTask *downloadTask = [[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
    }];
    XCTAssertNotNil(downloadTask);
}
/**
 ** Test MSURLSessionDownloadTask with Failed Auth
 ** Test [MSURLSessionDownloadTask execute];
 */
- (void)testMSURLSessionDownloadTaskFailedAuth {
    __block NSError *authError = [NSError errorWithDomain:@"autherror" code:123 userInfo:@{}];
    [self setAuthProvider:self.mockAuthProvider appendHeaderResponseWith:nil error:authError];
    
    __block MSURLSessionDownloadTask *downloadTask = [[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        XCTAssertEqual(authError, error);
    }];
    
    XCTAssertEqual(downloadTask.state, MSURLSessionTaskStateTaskCreated);
    [downloadTask execute];
    XCTAssertEqual(downloadTask.state, MSURLSessionTaskStateTaskAuthFailed);
}
/**
 Test [MSURLSessionDownloadTask taskWithRequest]
 */
- (void)testMSURLSessionDownloadTaskCompletionHandler{
    __block NSURL *fileLocation = [NSURL URLWithString:@"foo/bar/baz"];
    __block NSHTTPURLResponse *validResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:200 HTTPVersion:@"foo" headerFields:@{}];
    __block NSProgress *mockProgress;
    
    [self mockURLSession:self.mockHttpProvider downloadTaskCompletionWithRequest:self.requestForMock progress:mockProgress url:fileLocation response:validResponse error:nil];
    MSURLSessionDownloadTask *downloadTask = [[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
        XCTAssertNil(error);
        XCTAssertEqual(location, fileLocation);
        XCTAssertEqual(validResponse, response);
    }];

    [downloadTask taskWithRequest:self.requestForMock];
    XCTAssertEqual(downloadTask.state, MSURLSessionTaskStateTaskCompleted);
}
/**
 ** Test [MSURLSessionDownloadTask taskWithRequest]
 ** Error code 400
 */
- (void)testMSURLSessionDownloadTaskFailedWithBadResponse{
    __block NSURL *fileLocation = [NSURL URLWithString:@"foo/bar/baz"];
    __block NSHTTPURLResponse *badRequest = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:400 HTTPVersion:@"test" headerFields:@{}];
    [self mockURLSession:self.mockHttpProvider downloadTaskCompletionWithRequest:self.requestForMock progress:nil url:fileLocation response:badRequest error:nil];
    
    MSURLSessionDownloadTask *downloadTask = [[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
        XCTAssertNil(location);
        XCTAssertEqual(error.code, 400);
        XCTAssertEqual(response, badRequest);
    }];
    
    [downloadTask taskWithRequest:self.requestForMock];
    XCTAssertEqual(downloadTask.state, MSURLSessionTaskStateTaskCompleted);
}
/**
 ** Test [MSURLSessionDownloadTask taskWithRequest]
 ** Error code 304
 */
-(void)testMSURLSessionDownloadTaskReceived304
{
    
    __block NSURL *fileLocation = [NSURL URLWithString:@"foo/bar/baz"];
    __block NSHTTPURLResponse *notModifiedResponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:304 HTTPVersion:@"foo" headerFields:@{}];
    
    [self mockURLSession:self.mockHttpProvider downloadTaskCompletionWithRequest:self.requestForMock progress:nil url:fileLocation response:notModifiedResponse error:nil];
    MSURLSessionDownloadTask *downloadTask = [[MSURLSessionDownloadTask alloc] initWithRequest:self.requestForMock client:self.mockClient completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
        XCTAssertNil(error);
        XCTAssertNil(location);
        XCTAssertEqual(response, notModifiedResponse);
    }];
    [downloadTask taskWithRequest:self.requestForMock];
    XCTAssertEqual(downloadTask.state, MSURLSessionTaskStateTaskCompleted);
}
@end

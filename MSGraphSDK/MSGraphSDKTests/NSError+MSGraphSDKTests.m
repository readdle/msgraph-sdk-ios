//
//  NSError+MSGraphSDKTests.m
//  MSGraphSDK
//
//  Created by canviz on 6/8/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSError+MSGraphSDK.h"
#import "MSConstants.h"
#import "MSError.h"

@interface NSError_MSGraphSDKTests : XCTestCase

@end

@implementation NSError_MSGraphSDKTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIsClientErrorFalse{
     NSError *testError = [NSError errorWithDomain:@"testError" code:123 userInfo:@{}];
    XCTAssertFalse([testError isClientError]);
}
-(void)testIsClientErrorTrue{
    NSError *testError = [NSError errorWithDomain:MSErrorDomain code:401 userInfo:@{}];
    XCTAssertTrue([testError isClientError]);
    
}
-(void)testClientError{
    MSError *msError = [MSError errorWithDictionary:@{@"code":@"Not Found", @"message": @"404 error", @"innererror":@{@"code":@"inner Not Found", @"message": @"inner 404 error"}}];
    NSError *testError = [NSError errorWithDomain:MSErrorDomain code:401 userInfo:@{@"error":msError}];
    MSError *clientError = [testError clientError];
    XCTAssertNotNil(clientError);
    XCTAssertEqualObjects([clientError code], @"Not Found");
    XCTAssertEqualObjects([clientError message], @"404 error");
    XCTAssertNotNil([clientError innerError]);
    XCTAssertTrue([[clientError innerError] isKindOfClass:[MSError class]]);
    
    MSError *innerError = [clientError innerError];
    XCTAssertNotNil(innerError);
    XCTAssertEqualObjects([innerError code], @"inner Not Found");
    XCTAssertEqualObjects([innerError message], @"inner 404 error");
    XCTAssertNil([innerError innerError]);
}
-(void)testClientErrorNil{
    MSError *msError = [MSError errorWithDictionary:@{@"code":@"Not Found", @"message": @"404 error", @"innererror":@{@"code":@"inner Not Found", @"message": @"inner 404 error"}}];
    NSError *testError = [NSError errorWithDomain:@"test error" code:401 userInfo:@{@"error":msError}];
    MSError *clientError = [testError clientError];
    XCTAssertNil(clientError);
}

- (void)testIsThrottlingError {
    NSError *error = [NSError errorWithDomain:MSErrorDomain code:429 userInfo:@{}];
    XCTAssertTrue(error.isThrottlingError);

    error = [NSError errorWithDomain:MSErrorDomain code:401 userInfo:@{}];
    XCTAssertFalse(error.isThrottlingError);
}

- (void)testRetryAfterDelay {
    NSError *const error = [NSError errorWithDomain:MSErrorDomain
                                               code:429
                                           userInfo:@{ @"Retry-After": @"23" }];
    XCTAssertEqual(error.retryAfterSeconds, 23);
}

@end

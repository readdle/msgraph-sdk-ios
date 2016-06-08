//
//  MSObjectTests.m
//  MSGraphSDK
//
//  Created by canviz on 6/1/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSObject.h"
#import "OCMock.h"


@interface MSObjectTests : XCTestCase

@end

@interface MSObjectTests(){
    NSDictionary *_userItemDic;
}
@end

@implementation MSObjectTests

- (void)setUp {
    [super setUp];
    _userItemDic = @{
        @"@odata.context": @"https://graph.microsoft.com/v1.0/$metadata#users/$entity",
        @"businessPhones": @[
                           @"+1 8888888888"
                           ],
        @"displayName": @"Tester Sun",
        @"givenName": @"Tester",
        @"jobTitle": @"Unit Tester",
        @"mail": @"testerSun@graphsdk.onmicrosoft.com",
        @"mobilePhone": @"+1 8888888888",
        @"preferredLanguage": @"en-US",
        @"surname": @"Sun",
        @"userPrincipalName": @"testerSun@graphsdk.onmicrosoft.com",
        @"id": @"8f98666a-c5eb-4497-910c-fa1204dec445"
        };
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testInit{
    MSObject *ob = [[MSObject alloc] init];
    XCTAssertNotNil(ob);
}
- (void)testNilDictionary{
    XCTAssertNil([[MSObject alloc] initWithDictionary:nil]);
}
- (void)testInitDictionary{
    MSObject *msObject= [[MSObject alloc] initWithDictionary:_userItemDic];
    XCTAssertNotNil(msObject);
    NSDictionary *outDic = [msObject dictionaryFromItem];
    XCTAssert([[outDic objectForKey:@"mail"] isEqualToString:[_userItemDic objectForKey:@"mail"]]);
    
    
    NSString *dateStr = @"2016-05-25T06:37:54Z";
    NSDate *retDate = [msObject dateFromString:dateStr];
    XCTAssertNotNil(retDate);
    NSString * dec = [msObject description];
    XCTAssertNotNil(dec);
    XCTAssert([dec isEqualToString:[outDic description]]);
}


@end

//
//  MSExpandOptionsTests.m
//  MSGraphSDK
//
//  Created by canviz on 6/3/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphSDK.h"
#import "MSFunctionParameters.h"

@interface MSOptionsTests : XCTestCase
@property NSMutableString *basicString;
@property NSString *firstKey;
@property NSString *firstValue;
@end

@implementation MSOptionsTests

- (void)setUp {
    [super setUp];
    self.firstKey = @"foo", self.firstValue = @"bar";
    self.basicString = [[NSMutableString alloc] initWithFormat:@"?%@=%@",self.firstKey,self.firstValue];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testMSExpandOptions{
    MSExpandOptions *msExpandOptions = [MSExpandOptions expand:@"thumb"];
    XCTAssertNotNil(msExpandOptions);
    XCTAssertEqualObjects(msExpandOptions.key, @"$expand");
    XCTAssertEqualObjects(msExpandOptions.value, @"thumb");

    NSMutableString *queryString = [self.basicString mutableCopy];
    [msExpandOptions appendOptionToQueryString:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@&$expand=thumb",self.basicString];
    XCTAssertEqualObjects(queryString, expectedString);
}

-(void)testMSFunctionParameters{
    MSFunctionParameters *msFunctionParameters = [[MSFunctionParameters alloc] initWithKey:self.firstKey value:self.firstValue];
    XCTAssertNotNil(msFunctionParameters);
    XCTAssertEqualObjects(msFunctionParameters.key, self.firstKey);
    XCTAssertEqualObjects(msFunctionParameters.value, self.firstValue);
    
    NSMutableString *queryString = [self.basicString mutableCopy];
    [msFunctionParameters appendOptionToFunctionParams:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@,foo='bar'",self.basicString];
    XCTAssertEqualObjects(queryString, expectedString);
}
-(void)testMSFunctionParametersWithNilValue{
    MSFunctionParameters *msFunctionParameters = [[MSFunctionParameters alloc] initWithKey:self.firstKey value:nil];
    XCTAssertNotNil(msFunctionParameters);
    XCTAssertEqualObjects(msFunctionParameters.key, self.firstKey);
    XCTAssertEqualObjects(msFunctionParameters.value, nil);
    
    NSMutableString *queryString = [self.basicString mutableCopy];
    [msFunctionParameters appendOptionToFunctionParams:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@,foo=(null)",self.basicString];
    XCTAssertEqualObjects(queryString, expectedString);
}
-(void)testMSHeaderOptions{
    MSHeaderOptions *hearderOptions =[[MSHeaderOptions alloc] initWithKey:self.firstKey value:self.firstValue];
    XCTAssertNotNil(hearderOptions);
    XCTAssertEqualObjects(hearderOptions.key, self.firstKey);
    XCTAssertEqualObjects(hearderOptions.value, self.firstValue);
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"xxcc", @"token", nil];
    [hearderOptions appendOptionToHeaders:dic];
    XCTAssertEqual([dic count], 2);
    XCTAssertEqualObjects([dic objectForKey:self.firstKey], self.firstValue);
    XCTAssertEqualObjects([dic objectForKey:@"token"], @"xxcc");
}
-(void)testMSIfMatch{
    MSIfMatch *msIfMatch = [MSIfMatch entityTags:self.firstValue];
    XCTAssertNotNil(msIfMatch);
    XCTAssertEqualObjects(msIfMatch.key, @"If-Match");
    XCTAssertEqualObjects(msIfMatch.value, self.firstValue);
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"xxcc", @"token", nil];
    [msIfMatch appendOptionToHeaders:dic];
    XCTAssertEqual([dic count], 2);
    XCTAssertEqualObjects([dic objectForKey:@"If-Match"], self.firstValue);
    XCTAssertEqualObjects([dic objectForKey:@"token"], @"xxcc");
}
-(void)testMSIfNoneMatch{
    MSIfNoneMatch *msIfNoneMatch = [MSIfNoneMatch entityTags:self.firstValue];
    XCTAssertNotNil(msIfNoneMatch);
    XCTAssertEqualObjects(msIfNoneMatch.key, @"If-None-Match");
    XCTAssertEqualObjects(msIfNoneMatch.value, self.firstValue);
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"xxcc", @"token", nil];
    [msIfNoneMatch appendOptionToHeaders:dic];
    XCTAssertEqual([dic count], 2);
    XCTAssertEqualObjects([dic objectForKey:@"If-None-Match"], self.firstValue);
    XCTAssertEqualObjects([dic objectForKey:@"token"], @"xxcc");
}
-(void)testMSOrderByOptions{
    MSOrderByOptions *msOrderByOptions = [MSOrderByOptions orderBy:@"name"];
    XCTAssertNotNil(msOrderByOptions);
    XCTAssertEqualObjects(msOrderByOptions.key, @"$orderby");
    XCTAssertEqualObjects(msOrderByOptions.value, @"name");
    
    NSMutableString *queryString = [self.basicString mutableCopy];
    [msOrderByOptions appendOptionToQueryString:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@&%@=%@",self.basicString, msOrderByOptions.key, msOrderByOptions.value];
    XCTAssertEqualObjects(queryString, expectedString);
}
-(void)testMSSelectOptions{
    MSSelectOptions *msSelectOptions = [MSSelectOptions select:@"name"];
    XCTAssertNotNil(msSelectOptions);
    XCTAssertEqualObjects(msSelectOptions.key, @"$select");
    XCTAssertEqualObjects(msSelectOptions.value, @"name");
    
    NSMutableString *queryString = [self.basicString mutableCopy];
    [msSelectOptions appendOptionToQueryString:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@&%@=%@",self.basicString, msSelectOptions.key, msSelectOptions.value];
    XCTAssertEqualObjects(queryString, expectedString);
}
-(void)testMSTopOptions{
    MSTopOptions *msTopOptions = [MSTopOptions top:10];
    XCTAssertNotNil(msTopOptions);
    XCTAssertEqualObjects(msTopOptions.key, @"$top");
    XCTAssertEqualObjects(msTopOptions.value, @"10");
    
    NSMutableString *queryString = [self.basicString mutableCopy];
    [msTopOptions appendOptionToQueryString:queryString];
    NSString *expectedString = [NSString stringWithFormat:@"%@&%@=%@",self.basicString, msTopOptions.key, msTopOptions.value];
    XCTAssertEqualObjects(queryString, expectedString);
}
@end

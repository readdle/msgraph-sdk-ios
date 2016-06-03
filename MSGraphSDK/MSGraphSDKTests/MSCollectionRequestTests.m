//
//  MSCollectionRequestTests.m
//  MSGraphSDK
//
//  Created by canviz on 6/1/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSGraphTestCase.h"
@interface MSCollectionRequestTests : MSGraphTestCase

@end

@implementation MSCollectionRequestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testMSCollectionRequest{
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];
    XCTAssertNotNil(collectionRequst);
    
    
    NSDictionary *firstObject = @{@"foo" : @"Bar" };
    NSDictionary *secondObject = @{@"baz" : @"qux" };
    NSArray *values = @[firstObject, secondObject];
    NSDictionary *responseObject = @{ MSCollectionValueKey : values, MSODataNextContext : @"foo" };
    
    NSHTTPURLResponse *OKresponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesOK HTTPVersion:@"foo" headerFields:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:[NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil] response:OKresponse error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest odObjectWithDictionary:^MSObject *(NSDictionary *response) {
        XCTAssertNotNil(response);
        XCTAssert([values containsObject:response]);
        MSObject *cast = [[MSObject alloc] initWithDictionary:response];
        return cast;
        
    } completion:^(MSCollection *response, NSError *error) {
        XCTAssertNotNil(response);
        XCTAssertNil(error);
        
        XCTAssertNotNil(response.value);
        [response.value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
            XCTAssert([obj isKindOfClass:[MSObject class]]);
            NSDictionary *result = [obj dictionaryFromItem];
            XCTAssert([values containsObject:result]);
        }];
        
        XCTAssertEqualObjects([response.nextLink absoluteString], [responseObject objectForKey:MSODataNextContext]);
        XCTAssertEqualObjects(response.additionalData, responseObject);
        
    }];
    [dataTask taskWithRequest:self.testRequest];
    
}
- (void)testMSCollectionRequestWithNilResponse{
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];

    [self dataTaskCompletionWithRequest:self.testRequest data:nil response:nil error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest odObjectWithDictionary:^MSObject *(NSDictionary *response) {
        // This should never get called if the response was nil
        XCTAssert(YES);
    } completion:^(MSCollection *response, NSError *error) {
        XCTAssertNil(response);
        XCTAssertNil(error);
    }];
    
    [dataTask taskWithRequest:self.testRequest];
    
}
- (void)testMSCollectionRequestWithBadResponse{
   NSHTTPURLResponse *Badresponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSClientErrorCodeBadRequest HTTPVersion:@"foo" headerFields:nil];
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];
    
    [self dataTaskCompletionWithRequest:self.testRequest data:nil response:Badresponse error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest odObjectWithDictionary:^MSObject *(NSDictionary *response) {
        // This should never get called if the response was nil
        XCTAssert(YES);
    } completion:^(MSCollection *response, NSError *error) {
        XCTAssertNil(response);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, MSClientErrorCodeBadRequest);
    }];
    
    [dataTask taskWithRequest:self.testRequest];
    
}

-(void)testMSCollectionRequestWithNilOdObject{
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];
    XCTAssertNotNil(collectionRequst);
    
    
    NSDictionary *firstObject = @{@"foo" : @"Bar" };
    NSDictionary *secondObject = @{@"baz" : @"qux" };
    NSArray *values = @[firstObject, secondObject];
    NSDictionary *responseObject = @{ MSCollectionValueKey : values, MSODataNextContext : @"foo" };
    
    NSHTTPURLResponse *OKresponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesOK HTTPVersion:@"foo" headerFields:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:[NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil] response:OKresponse error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest odObjectWithDictionary:^MSObject *(NSDictionary *response) {
        XCTAssertNotNil(response);
        XCTAssert([values containsObject:response]);
        if([response.allKeys  containsObject:@"foo"]){
            return nil;
        }
        else{
            MSObject *cast = [[MSObject alloc] initWithDictionary:response];
            return cast;
        }
    } completion:^(MSCollection *response, NSError *error) {
        XCTAssertNil(response);
        XCTAssertNil(error);
    }];
    [dataTask taskWithRequest:self.testRequest];
    
}

-(void)testMSCollectionRequestWithEmptyValue{
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];
    NSDictionary *responseObject = @{ MSCollectionValueKey : @[], MSODataNextContext : @"foo" };
    
    NSHTTPURLResponse *OKresponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesOK HTTPVersion:@"foo" headerFields:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:[NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil] response:OKresponse error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest odObjectWithDictionary:^MSObject *(NSDictionary *response) {
        XCTAssert(YES);
        return nil;
        }
     completion:^(MSCollection *response, NSError *error) {
        XCTAssertNotNil(response);
         XCTAssertNotNil(response.value);
         XCTAssertEqual(response.value.count,0);
        XCTAssertNil(error);
    }];
    [dataTask taskWithRequest:self.testRequest];
    
}
-(void)testMSCollectionRequestWithNilNextLink{
    MSCollectionRequest *collectionRequst = [[MSCollectionRequest alloc] initWithURL:self.testBaseURL client:self.mockClient];
    
    NSDictionary *firstObject = @{@"foo" : @"Bar" };
    NSDictionary *secondObject = @{@"baz" : @"qux" };
    NSArray *values = @[firstObject, secondObject];
    NSDictionary *responseObject = @{ MSCollectionValueKey : values};
    
    NSHTTPURLResponse *OKresponse = [[NSHTTPURLResponse alloc] initWithURL:self.testBaseURL statusCode:MSExpectedResponseCodesOK HTTPVersion:@"foo" headerFields:nil];
    [self dataTaskCompletionWithRequest:self.testRequest data:[NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil] response:OKresponse error:nil];
    
    MSURLSessionDataTask *dataTask = [collectionRequst collectionTaskWithRequest:self.testRequest
                                                          odObjectWithDictionary:^MSObject *(NSDictionary *response) {
                                                              MSObject *cast = [[MSObject alloc] initWithDictionary:response];
                                                              return cast;
                                                          }
                                                                      completion:^(MSCollection *response, NSError *error) {
                                                                          XCTAssertNotNil(response);
                                                                          XCTAssertNotNil(response.value);
                                                                          XCTAssertNil(response.nextLink);
                                                                          XCTAssertNil(error);
                                                                      }];
    [dataTask taskWithRequest:self.testRequest];
    
}

@end

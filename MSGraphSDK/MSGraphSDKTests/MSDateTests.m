//
//  MSDateTests.m
//  MSGraphSDK
//
//  Created by canviz on 6/3/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "MSGraphSDK.h"

@interface MSDate (Test)

@property (nonatomic, strong) NSDate *date;

@end

@interface MSDateTests : XCTestCase
@property NSInteger testYear;
@property NSInteger testMonth;
@property NSInteger testDay;
@property NSDateComponents *dateComponents;
@end

@implementation MSDateTests

- (void)setUp {
    [super setUp];
    self.testYear = 2016, self.testMonth = 6, self.testDay = 11;
    self.dateComponents = [[NSDateComponents alloc] init];
    self.dateComponents.year = self.testYear;
    self.dateComponents.month = self.testMonth;
    self.dateComponents.day = self.testDay;
    self.dateComponents.calendar = [NSCalendar currentCalendar];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testInit{
    MSDate *msdate = [MSDate date];
    XCTAssertNotNil(msdate);
    
    msdate = [MSDate dateWithYear:self.testYear month:self.testMonth day:self.testDay];
    XCTAssertNotNil(msdate);
    
    XCTAssertNoThrow([MSDate dateWithYear:0 month:0 day:0]);
}

-(void)testInitWithNSDate{
    NSDate *nowData = [NSDate date];
    MSDate *msdate = [[MSDate alloc] initWithNSDate: nowData];
    XCTAssertNotNil(msdate);
    XCTAssertEqualObjects(msdate.date, nowData);
}
-(void)testInitWithNilNSDate{
    MSDate *msdate = [[MSDate alloc] initWithNSDate: nil];
    XCTAssertNotNil(msdate);
    XCTAssertNil(msdate.date);
}
-(void)testInitWithYear{
    MSDate *msdate = [[MSDate alloc] initWithYear:self.testYear month:self.testMonth day:self.testDay];
    XCTAssertEqualObjects(msdate.date, [self.dateComponents date]);
}

-(void)testMSDatePropertiesFromInitWithYear{
    MSDate *msdate = [[MSDate alloc] initWithYear:self.testYear month:self.testMonth day:self.testDay];
    XCTAssertEqual([msdate year], self.testYear);
    XCTAssertEqual(msdate.month, self.testMonth);
    XCTAssertEqual(msdate.day, self.testDay);
}
-(void)testMSDateProertiesFromInitWithDate{
    
    NSDate *nowData = [NSDate date];
    MSDate *msdate = [[MSDate alloc] initWithNSDate: nowData];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    XCTAssertEqual(msdate.year, components.year);
    XCTAssertEqual(msdate.month, components.month);
    XCTAssertEqual(msdate.day, components.day);
    
}

-(void)testMs_toString{
    MSDate *msdate = [[MSDate alloc] initWithYear:self.testYear month:self.testMonth day:self.testDay];
    NSString *dateString = [msdate ms_toString];
    NSString *expectedString =[NSString stringWithFormat:@"%@-0%@-%@",[@(self.testYear) stringValue],[@(self.testMonth) stringValue],[@(self.testDay) stringValue]];
    XCTAssertEqualObjects(dateString, expectedString);
}

-(void)testMs_dateFromString{
    MSDate *msdate = [MSDate ms_dateFromString:[NSString stringWithFormat:@"%@-0%@-%@",[@(self.testYear) stringValue],[@(self.testMonth) stringValue],[@(self.testDay) stringValue]]];
    
    XCTAssertNotNil(msdate);
    XCTAssertEqualObjects(msdate.date, [self.dateComponents date]);
}
-(void)testMs_dateFromNilString{
    MSDate *msdate = [MSDate ms_dateFromString:nil];
    XCTAssertNotNil(msdate);
    XCTAssertNil(msdate.date);
}
-(void)testMs_dateFromInvalidFormatterString{
    MSDate *msdate = [MSDate ms_dateFromString:@"test"];
    XCTAssertNotNil(msdate);
    XCTAssertNil(msdate.date);
}

@end

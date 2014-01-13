//
//  teste123.m
//  tipd
//
//  Created by Bruno Avelar on 08/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TipBill.h"

@interface tipBillTests : XCTestCase

@end

@implementation tipBillTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testCalculateTipAmount
{
    TipBill *bill = [[TipBill alloc] init];
    bill.amount = 123.45;
    bill.segment = 1;
    bill.percent = 0.10;
    
    XCTAssertEqualWithAccuracy(bill.tip, 12.34, 0.05);
}

@end

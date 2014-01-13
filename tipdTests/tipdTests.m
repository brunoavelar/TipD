//
//  tipdTests.m
//  tipdTests
//
//  Created by Bruno Avelar Lima Alcantara on 03/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "TipBill.h"

@interface tipdTests : XCTestCase

@property (strong, nonatomic) ViewController *vc;

@end

@implementation tipdTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateInitialViewController];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVCInstantiates
{
    XCTAssertNotNil(self.vc);
}

- (void)testDisplayTotalAmountFor0
{
    [self.vc displayTotalAmount:0];
    NSString *result = self.vc.billAmount.text;
    
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTotalAmountFor123Dot45
{
    [self.vc displayTotalAmount:123.45];
    NSString *result = self.vc.billAmount.text;
    
    XCTAssertEqualObjects(result, @"$123.45");
}

- (void)testDisplayTipAmountFor0
{
    [self.vc displayTotalAmount:0];
    NSString *result = self.vc.billAmount.text;
    
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTipAmountFor45
{
    [self.vc displayTipAmount: 45];
    NSString *result = self.vc.tipAmount.text;
    
    XCTAssertEqualObjects(result, @"$45.00");
}

- (void)testCalculateTipPercentForSegment0
{
    double percent = [self.vc calculateTipPercentForSegment:0];
    
    XCTAssertEqualWithAccuracy(percent, 0.05, 0.001, @"Expected percent %f should be 0.05", percent);
}

- (void)testCalculateTipPercentForSegment1
{
    double percent = [self.vc calculateTipPercentForSegment:1];
    
    XCTAssertEqualWithAccuracy(percent, 0.1, 0.001, @"Expected percent %f should be 0.1", percent);
}

- (void)testCalculateTipPercentForSegment2
{
    double percent = [self.vc calculateTipPercentForSegment:2];
    
    XCTAssertEqualWithAccuracy(percent, 0.15, 0.001, @"Expected percent %f should be 0.15", percent);
}

- (void)testCalculateTipPercentForSegment3
{
    double percent = [self.vc calculateTipPercentForSegment:3];
    
    XCTAssertEqualWithAccuracy(percent, 0.20, 0.001, @"Expected percent %f should be 0.20", percent);
}

- (void)testCalculateTipPercentForSegment4
{
    double percent = [self.vc calculateTipPercentForSegment:4];
    
    XCTAssertEqualWithAccuracy(percent, 0.25, 0.001, @"Expected percent %f should be 0.25", percent);
}

- (void)testGetBillAmountWhenBlank
{
    self.vc.billAmount.text = @"";
    double result = [self.vc getBillAmount];
    
    XCTAssertEqualWithAccuracy(result, 0.0, 0.001);
}

- (void)testGetBillAmountFor12Point34
{
    self.vc.billAmount.text = @"12.34";
    double result = [self.vc getBillAmount];
    
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}

- (void)testGetBillAmountFor12Point34Point56
{
    self.vc.billAmount.text = @"12.34.56";
    double result = [self.vc getBillAmount];
    
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}



- (void)testUpdateDisplayedTipFor0
{
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    
    XCTAssertEqualObjects(tipString, @"$0.00");
}

- (void)testUpdateDisplayedTipFor10By10
{
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    
    XCTAssertEqualObjects(tipString, @"$1.00");
}

- (void)testUpdateDisplayedTotalFor0
{
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *total = self.vc.totalAmount.text;
    
    XCTAssertEqualObjects(total, @"$0.00");
}

- (void)testUpdateDisplayedTotalFor10By10
{
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *tipString = self.vc.totalAmount.text;
    
    XCTAssertEqualObjects(tipString, @"$11.00");
}

- (void)testCreateTipBillFromInterfaceValuesCreatesObject
{
    self.vc.tipPercent.selectedSegmentIndex = 1;
    
    TipBill *tipBill = [self.vc createTipBillFromInterfaceValues];
    
    XCTAssertNotNil(tipBill);
    
}


- (void)testCreateTipBillFromInterfaceValuesWithCorrectValues
{
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    
    TipBill *expectedBill = [[TipBill alloc] init];
    expectedBill.amount = 10.00;
    expectedBill.segment = 1;
    expectedBill.percent = 0.10;
    
    TipBill *tipBill = [self.vc createTipBillFromInterfaceValues];
    
    XCTAssertEqualObjects(expectedBill, tipBill);

}

@end

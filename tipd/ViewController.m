//
//  ViewController.m
//  tipd
//
//  Created by Bruno Avelar Lima Alcantara on 03/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "ViewController.h"
#import "TipBill.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self displayTheKeyboard];
}

- (void)displayTheKeyboard
{
    [self.billAmount becomeFirstResponder];
}

- (void)dismissTheKeyboard
{
    [self.billAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender
{
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissTheKeyboard];
}

- (void)displayTotalAmount:(double)amount
{
    
    self.billAmount.text = [self formatCurrency:amount];
}

- (void)displayTipAmount:(double)amount
{
    
    self.tipAmount.text = [self formatCurrency:amount];
}

- (NSString *)formatCurrency:(double)amount
{
    NSNumber *number = [NSNumber numberWithDouble:amount];
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    
    return [nf stringFromNumber:number];
}

- (double)calculateTipPercentForSegment:(int)segment
{
    NSString *tipText = [self.tipPercent titleForSegmentAtIndex:segment];
    
    return [tipText doubleValue] / 100.00;
}

- (double)getBillAmount
{
    return [self.billAmount.text doubleValue];
}

- (void)updateDisplayedTip
{
    TipBill *bill = [self createTipBillFromInterfaceValues];
    
    self.tipAmount.text = [self formatCurrency:bill.tip];
}

- (void)updateDisplayedTotal
{
    TipBill *bill = [self createTipBillFromInterfaceValues];
    
    self.totalAmount.text = [self formatCurrency:bill.total];
}

- (TipBill*)createTipBillFromInterfaceValues
{
    TipBill *tipBill = [[TipBill alloc] init];
    tipBill.amount = [self getBillAmount];
    tipBill.segment = self.tipPercent.selectedSegmentIndex;
    tipBill.percent = [self calculateTipPercentForSegment:tipBill.segment];
    
    return tipBill;
}

@end

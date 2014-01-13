//
//  ViewController.h
//  tipd
//
//  Created by Bruno Avelar Lima Alcantara on 03/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipBill.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;
@property (weak, nonatomic) IBOutlet UITextField *tipAmount;
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender;

- (void)displayTotalAmount:(double)amount;
- (void)displayTipAmount:(double)amount;

- (double)calculateTipPercentForSegment:(int)segment;

- (double)getBillAmount;

- (void)updateDisplayedTip;
- (void)updateDisplayedTotal;

- (TipBill*)createTipBillFromInterfaceValues;

@end

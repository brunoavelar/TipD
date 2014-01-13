//
//  TipBill.h
//  tipd
//
//  Created by Bruno Avelar on 07/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipBill : NSObject

@property double amount;
@property int segment;
@property double percent;
@property (readonly, getter = getTip) double tip;
@property (readonly, getter = getTotal) double total;

- (double)getTotal;
- (double)getTip;

- (BOOL)isEqualToTipBill:(TipBill*)other;

@end

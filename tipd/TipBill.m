//
//  TipBill.m
//  tipd
//
//  Created by Bruno Avelar on 07/01/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "TipBill.h"

@implementation TipBill



- (double)getTip
{
    return self.amount * self.percent;
}

- (double)getTotal
{
    return self.amount + self.tip;
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToTipBill:other];
}

- (BOOL)isEqualToTipBill:(TipBill*)other
{
    return self.amount == other.amount &&
    self.segment == other.segment &&
    self.percent == other.percent;
}

- (NSUInteger)hash
{
    NSUInteger amount = [[NSNumber numberWithDouble:self.amount] hash];
    NSUInteger segment = [[NSNumber numberWithDouble:self.segment] hash];
    NSUInteger percent = [[NSNumber numberWithDouble:self.percent] hash];
    
    return (amount ^ segment * percent);
}

@end

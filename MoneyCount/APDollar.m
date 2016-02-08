//
//  APDollar.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 04/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APDollar.h"
#import "APMoney-Private.h"
@interface APDollar()
@end

@implementation APDollar

-(instancetype) times:(NSUInteger) multiplier{
    APDollar *newDollar = [[APDollar alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newDollar;
}

@end

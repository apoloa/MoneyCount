//
//  APEuro.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 01/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APEuro.h"
#import "APMoney-Private.h"

@implementation APEuro

-(instancetype) times:(NSUInteger) multiplier{
    APEuro *newEuro = [[APEuro alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newEuro;
}

@end

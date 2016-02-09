//
//  APMoney.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "APMoney-Private.h"
#import "APEuro.h"
#import "APDollar.h"

@implementation APMoney

+(instancetype) euroWithAmount:(NSInteger) amount{
    return [[APEuro alloc] initWithAmount:amount];
}

+(instancetype) dollarWithAmount:(NSInteger) amount{
    return [[APDollar alloc] initWithAmount:amount];
}

-(id) initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}
-(id) times:(NSUInteger) multiplier{
    
    APMoney* newMoney = [[APMoney alloc]  initWithAmount:[self.amount integerValue] * multiplier];
    
    return newMoney;
}

#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end

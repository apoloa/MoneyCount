//
//  APMoney.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APMoney.h"
#import "APBroker.h"
#import "NSObject+GNUStepAddons.h"


@implementation APMoney

+(id) euroWithAmount:(NSInteger) amount{
    return [[APMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[APMoney alloc] initWithAmount:amount currency:@"USD"];
}

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}
-(id<APMoney>) times:(NSUInteger) multiplier{
    
    APMoney* newMoney = [[APMoney alloc]  initWithAmount:[self.amount integerValue] * multiplier
                                                currency:self.currency];
    return newMoney;
}

-(id<APMoney>) plus:(APMoney *)other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    APMoney *total = [[APMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

-(APMoney *) reduceToCurrency:(NSString *) currency
                   withBroker:(APBroker*) broker{
    APMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if(rate ==0 ){
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        NSInteger newAmount = [self.amount integerValue] *rate;
        
        result = [[APMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;
}


#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency ,self.amount];
}

-(BOOL) isEqual:(id)object{
    if([self.currency isEqual:[object currency]]){
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end

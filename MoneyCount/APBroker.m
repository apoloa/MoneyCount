//
//  APBroker.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 09/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APBroker.h"
#import "APMoney.h"
@interface APBroker()

@end

@implementation APBroker

-(id) init{
    if(self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(APMoney *)reduce:(id<APMoney>) money toCurrency:(NSString*) currency{
    
    
    APMoney *result = [money reduceToCurrency:currency
                                   withBroker:self];
    return result;
}

-(void) addRate:(double)rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1-rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}




#pragma mark - Utils
-(NSString*)keyFromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end

//
//  APWallet.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 12/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APWallet.h"

@interface APWallet()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation APWallet

-(NSUInteger) moneyTypes{
    return [self arrayMoneys].count;
}
-(NSInteger) moneysCountFromType:(NSInteger) type{
    NSString *currency = [self moneyTypeForIndex:type];
    return [[self arrayMoneysFromCurrency:currency] count];
}

-(id)initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
    if (self = [super init]){
        APMoney *money = [[APMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<APMoney>)plus:(APMoney *)other{
    [self.moneys addObject:other];
    return self;
}

-(id<APMoney>)times:(NSUInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count ];
    for (APMoney *money in self.moneys) {
        APMoney *newMoney = [money times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(APMoney *) reduceToCurrency:(NSString *) currency
                   withBroker:(APBroker*) broker{
    APMoney *result = [[APMoney alloc] initWithAmount:0 currency:currency];
    for(APMoney *money in self.moneys){
        APMoney *newMoney = [money reduceToCurrency:currency withBroker:broker];
        result = [result plus:newMoney];
    }
    
    return result;
}

-(NSMutableArray *) arrayMoneys{
    NSMutableArray *moneyTypes = [NSMutableArray array];
    for (APMoney *money in self.moneys){
        if(![moneyTypes containsObject:money.currency]){
            [moneyTypes addObject:money.currency];
        }
    }
    return moneyTypes;
}

-(NSMutableArray *) arrayMoneysFromCurrency:(NSString *)currency{
    NSMutableArray *moneysCurrency = [NSMutableArray array];
    for( APMoney *money in self.moneys){
        if ([money.currency isEqual: currency]){
            [moneysCurrency addObject:money];
        }
    }
    return moneysCurrency;
}

-(APMoney *) moneyForIndex:(NSInteger) index moneyTypes:(NSInteger) moneyType{
    NSString *currency = [self moneyTypeForIndex:moneyType];
    return [[self arrayMoneysFromCurrency:currency] objectAtIndex:index];
}


-(NSString *) moneyTypeForIndex:(NSInteger) index{
    return [[self arrayMoneys] objectAtIndex:index];
}

-(APMoney *) sumForSameCurrency:(NSString *) currency{
    APMoney *result = [[APMoney alloc] initWithAmount:0 currency:currency];
    for (APMoney *money in [self arrayMoneysFromCurrency:currency]){
        result = [result plus:money];
    }
    return result;
}

@end

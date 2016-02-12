//
//  APBroker.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 09/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMoney.h"
@class APMoney;
@interface APBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(APMoney*)reduce:(id<APMoney>)money
        toCurrency:(NSString*) currency;

-(void) addRate:(double)rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency;

-(NSString*)keyFromCurrency:(NSString*)fromCurrency
                 toCurrency:(NSString*)toCurrency;

@end

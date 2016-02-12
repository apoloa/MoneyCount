//
//  APMoney.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APMoney;
@class APBroker;
@protocol APMoney <NSObject>

-(id) initWithAmount:(NSUInteger) amount
            currency:(NSString *) currency;
-(id<APMoney>) times:(NSUInteger) multiplier;
-(id<APMoney>) plus:(APMoney *)other;

-(APMoney *) reduceToCurrency:(NSString *) currency
                      withBroker:(APBroker*) broker;
@end

@interface APMoney : NSObject <APMoney>

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) NSNumber *amount;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

@end

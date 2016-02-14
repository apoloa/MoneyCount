//
//  APWallet.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 12/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMoney.h"
@interface APWallet : NSObject<APMoney>

@property (nonatomic, readonly) NSUInteger moneyTypes;

-(APMoney *) moneyForIndex:(NSInteger) index moneyTypes:(NSInteger) moneyType;

-(NSString *) moneyTypeForIndex:(NSInteger) index;

-(APMoney *) sumForSameCurrency:(NSString *) currency;

-(NSInteger) moneysCountFromType:(NSInteger) type;

@end

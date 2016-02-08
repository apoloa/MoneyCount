//
//  APDollar.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 04/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMoney.h"
@interface APDollar : APMoney

-(id) initWithAmount:(NSUInteger) amount;
-(instancetype) times:(NSUInteger) multiplier;

@end

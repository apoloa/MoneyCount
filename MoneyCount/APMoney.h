//
//  APMoney.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMoney : NSObject

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id) initWithAmount:(NSUInteger) amount;
-(id) times:(NSUInteger) multiplier;

@end

//
//  APEuro.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 01/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APEuro : NSObject

@property (nonatomic, readonly) NSUInteger amount;

-(id) initWithAmount:(NSUInteger) amount;
-(instancetype) times:(NSUInteger) multiplier;

@end

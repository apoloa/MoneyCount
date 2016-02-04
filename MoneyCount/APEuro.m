//
//  APEuro.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 01/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APEuro.h"

@interface APEuro()

@property (nonatomic) NSUInteger amount;

@end

@implementation APEuro

-(id) initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}
-(instancetype) times:(NSUInteger) multiplier{
    APEuro *newEuro = [[APEuro alloc] initWithAmount:self.amount * multiplier];
    
    return newEuro;
}


#pragma mark - Overwritten

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

@end

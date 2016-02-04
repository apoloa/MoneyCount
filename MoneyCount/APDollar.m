//
//  APDollar.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 04/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APDollar.h"

@interface APDollar()
@property (nonatomic) NSUInteger amount;
@end

@implementation APDollar

-(id) initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}
-(instancetype) times:(NSUInteger) multiplier{
    APDollar *newDollar = [[APDollar alloc] initWithAmount:self.amount * multiplier];
    
    return newDollar;
}


#pragma mark - Overwritten

-(BOOL) isEqual:(id)object{
    if(self == object){
        return true;
    }
    if([self class] == [object class]){
        return [self amount] == [object amount];
    }
    return false;
}

@end

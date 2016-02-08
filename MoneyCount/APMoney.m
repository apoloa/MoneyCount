//
//  APMoney.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "APMoney-Private.h"

@implementation APMoney

-(id) initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}
-(instancetype) times:(NSUInteger) multiplier{
    
    return [self subclassResponsability:_cmd];
}

#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    if(self == object){
        return true;
    }
    if([self class] == [object class]){
        return [self amount] == [object amount];
    }
    return false;
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end

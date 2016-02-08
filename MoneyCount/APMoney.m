//
//  APMoney.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface APMoney ()
@property (nonatomic) NSUInteger amount;

@end

@implementation APMoney

-(id) initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}
-(instancetype) times:(NSUInteger) multiplier{
    
    return [self subclassResponsability:_cmd];
}

@end

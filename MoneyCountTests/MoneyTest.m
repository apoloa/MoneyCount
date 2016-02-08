//
//  MoneyTest.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 08/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APMoney.h"
@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

-(void) testThatTimesRaiseException{
    APMoney *money = [[APMoney alloc] initWithAmount:1];
    
    XCTAssertThrows([money times:2], @"Should raise an exception");
}

@end

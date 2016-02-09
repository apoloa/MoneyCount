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

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[APMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[APMoney dollarWithAmount:1] currency], @"The currency of $ should be USD");
}

@end

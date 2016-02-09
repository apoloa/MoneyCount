//
//  DollarTest.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 04/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APDollar.h"
#import "APMoney.h"
@interface DollarTest : XCTestCase

@end

@implementation DollarTest

-(void) testMultiplication{
    APDollar *five = [APMoney dollarWithAmount: 5];
    APDollar *total = [five times:2];
    APDollar *ten = [APMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten,total, @"$5 * 2 = $10");
}

-(void) testEquality{
    APDollar *five = [APMoney dollarWithAmount:5];
    APDollar *total = [five times:2];
    APDollar *ten = [APMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should be not equal");
}

-(void) testHash{
    APDollar *a =[APMoney dollarWithAmount:2];
    APDollar *b =[APMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    APDollar *dollar = [APMoney dollarWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end

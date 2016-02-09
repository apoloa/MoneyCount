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

-(void) testSimpleMultiplication{
    APMoney *five = [APMoney euroWithAmount:5];
    APMoney *ten = [APMoney euroWithAmount:10];
    APMoney *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"5€ * 2 should be 10€");
}

-(void) testEquality{
    APMoney *five = [APMoney euroWithAmount:5];
    APMoney *ten = [APMoney euroWithAmount:10];
    
    APMoney *total = [five times:2];
    
    XCTAssertNotEqualObjects(ten, nil, @"Nil not should be equal");
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
    
    XCTAssertEqualObjects([APMoney dollarWithAmount:4], [[APMoney dollarWithAmount:2] times:2], @"Equivalent objects should be equal");
    
    XCTAssertNotEqualObjects(ten, [APMoney dollarWithAmount:10], @"Euro not should be equal that Dollar");
}

-(void) testHash{
    APMoney *a =[APMoney euroWithAmount:2];
    APMoney *b =[APMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
    XCTAssertEqual([[APMoney dollarWithAmount:1] hash], [[APMoney dollarWithAmount:1] hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    APMoney *money = [APMoney euroWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[money performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
    XCTAssertEqual(2, [[[APMoney  dollarWithAmount:2]performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}


-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[APMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[APMoney dollarWithAmount:1] currency], @"The currency of $ should be USD");
}

-(void) testSimpleAddition{
    XCTAssertEqualObjects([[APMoney dollarWithAmount:5] plus: [APMoney dollarWithAmount:5]], [APMoney dollarWithAmount:10], @"$5 + $5 = $10");
}

@end

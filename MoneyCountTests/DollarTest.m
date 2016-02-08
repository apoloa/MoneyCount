//
//  DollarTest.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 04/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APDollar.h"
@interface DollarTest : XCTestCase

@end

@implementation DollarTest

-(void) testMultiplication{
    APDollar *five = [[APDollar alloc] initWithAmount: 5];
    APDollar *total = [five times:2];
    APDollar *ten = [[APDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(ten,total, @"$5 * 2 = $10");
}

-(void) testEquality{
    APDollar *five = [[APDollar alloc] initWithAmount:5];
    APDollar *total = [five times:2];
    APDollar *ten = [[APDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should be not equal");
}

-(void) testHash{
    APDollar *a =[[APDollar alloc] initWithAmount:2];
    APDollar *b =[[APDollar alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    APDollar *dollar = [[APDollar alloc] initWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end

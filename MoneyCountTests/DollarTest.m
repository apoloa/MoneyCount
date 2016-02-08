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
}

@end

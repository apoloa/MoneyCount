//
//  EuroTests.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 01/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APEuro.h"
@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void) testSimpleMultiplication{
    APEuro *five =[[APEuro alloc] initWithAmount: 5];
    APEuro *total = [five times:2];
    
    XCTAssertEqual(15, total.amount, @"5*2 should be 10");
}

@end

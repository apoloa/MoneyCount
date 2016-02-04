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

-(void) testSimpleMultiplication{
    APEuro *five =[[APEuro alloc] initWithAmount: 5];
    APEuro *ten = [[APEuro alloc] initWithAmount:10];
    APEuro *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"5€ * 2 should be 10€");
    
    APEuro *fiveteen = [five times:3];
    APEuro *compare = [[APEuro alloc] initWithAmount:15];
    XCTAssertEqualObjects(compare, fiveteen, @"5*3 should be 15");
}

-(void) testEquality{
    APEuro *five = [[APEuro alloc] initWithAmount:5];
    APEuro *ten = [[APEuro alloc] initWithAmount:10];
    
    APEuro *total = [five times:2];
    
    XCTAssertNotEqualObjects(ten, nil, @"Nil not should be equal");
    
    XCTAssertNotEqualObjects(ten, @"10", @"Ten not should be equal");
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
}

@end

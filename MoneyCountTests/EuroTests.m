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
}

-(void) testEquality{
    APEuro *five = [[APEuro alloc] initWithAmount:5];
    APEuro *ten = [[APEuro alloc] initWithAmount:10];
    
    APEuro *total = [five times:2];
    
    XCTAssertNotEqualObjects(ten, nil, @"Nil not should be equal");
    
    XCTAssertNotEqualObjects(ten, @"10", @"Ten not should be equal");
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
}

-(void) testHash{
    APEuro *a =[[APEuro alloc] initWithAmount:2];
    APEuro *b =[[APEuro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    APEuro *euro = [[APEuro alloc] initWithAmount:2];
#pragma clang diagnostic push 
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end

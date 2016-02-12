//
//  BrokerTests.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 09/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APMoney.h"
#import "APBroker.h"
@interface BrokerTests : XCTestCase
@property (nonatomic, strong) APBroker *emptyBroker;
@property (nonatomic, strong) APMoney *oneDollar;
@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    self.emptyBroker = [APBroker new];
    self.oneDollar = [APMoney dollarWithAmount:1];
}

- (void)tearDown {
    self.emptyBroker = nil;
    self.oneDollar = nil;
    [super tearDown];
}

- (void)testSimpleReduction {
    APMoney *sum = [[APMoney dollarWithAmount:5] plus:[APMoney dollarWithAmount:5]];
    
    APMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

-(void) testReduction{
    //$10 == €5 2:1
    [self.emptyBroker addRate: 0.5 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    APMoney *dollars = [APMoney dollarWithAmount:10];
    APMoney *euros = [APMoney euroWithAmount:5];
    
    APMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void) testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:self.oneDollar.currency]);
}


@end

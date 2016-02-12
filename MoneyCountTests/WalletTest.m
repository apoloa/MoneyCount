
//
//  Wallet.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 12/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APMoney.h"
#import "APBroker.h"
#import "APWallet.h"
@interface Wallet : XCTestCase

@end

@implementation Wallet

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
/*
- (void) additionWithReduction{
    // 40€ + 20$ = 100$ 2:1
    APBroker *broker = [APBroker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    APWallet *wallet = [[APWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[APMoney dollarWithAmount:20]];
    
    APMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [APMoney dollarWithAmount:100], @"40€ + 20$ = 100$ 2:1");
}
 */

@end

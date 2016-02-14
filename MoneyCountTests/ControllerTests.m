//
//  ControllerTests.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 13/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APWalletTableViewController.h"
#import "APWallet.h"
#import "APBroker.h"
@interface ControllerTests : XCTestCase

@property (nonatomic, strong) APWalletTableViewController *walletVC;
@property (nonatomic, strong) APWallet *wallet;
@property (nonatomic, strong) APBroker *broker;

@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    self.wallet = [[APWallet alloc] initWithAmount:1 currency:@"USD"];
    
    self.broker = [APBroker new];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    [self.wallet plus:[APMoney euroWithAmount:1]];
    [self.wallet plus:[APMoney dollarWithAmount:12]];
    [self.wallet plus:[APMoney euroWithAmount:2]];
    self.walletVC = [[APWalletTableViewController alloc] initWithModel:self.wallet broker:self.broker];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatTablehasOneSection {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
#pragma clang diagnostic pop
    XCTAssertEqual(sections, self.wallet.moneyTypes + 1, @"There can only be one!");
}

- (void)testThatNumberOfcellsIsNumberOfMoneyPlusOne{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertEqual([self.wallet moneysCountFromType:0] + 1, [self.walletVC tableView:nil numberOfRowsInSection:0],@"Number of cells is the number of moneys plus 1 (the total) in the section");
#pragma clang diagnostic pop
}

-(void) testRowCellAtIndexPath{
    
    NSIndexPath *index  = [NSIndexPath indexPathForRow:0 inSection:0];
    
    APMoney *money=[self.wallet moneyForIndex:index.row moneyTypes:index.section];
    
    XCTAssertEqualObjects(money.description, @"<APMoney: USD 1>",@"Row 0 and section 0 must be APMoney: USD 1");
}

-(void) testTitleForHeaderInSection{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertEqual(@"Total Wallet", [self.walletVC tableView:nil titleForHeaderInSection:[self.wallet moneyTypes]], @"The last element needs show header with Total Wallet");
    
    XCTAssertEqual([self.wallet moneyTypeForIndex:0], [self.walletVC tableView:nil titleForHeaderInSection:0], @"The name of the section should be equals");
#pragma clang diagnostic pop
}

@end

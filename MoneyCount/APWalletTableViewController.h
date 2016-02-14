//
//  APWalletTableViewController.h
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 13/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APWallet;
@class APBroker;

@interface APWalletTableViewController : UITableViewController

-(id) initWithModel:(APWallet *) wallet broker:(APBroker *) broker;

@end

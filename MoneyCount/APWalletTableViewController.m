//
//  APWalletTableViewController.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 13/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "APWalletTableViewController.h"
#import "APWallet.h"
#import "APBroker.h"

@interface APWalletTableViewController ()
@property (nonatomic, strong) APWallet *wallet;
@property (nonatomic, strong) APBroker *broker;
@end

@implementation APWalletTableViewController

-(id) initWithModel:(APWallet *) wallet broker:(APBroker *) broker{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){
        _wallet = wallet;
        _broker = broker;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wallet moneyTypes] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.wallet moneyTypes] == section){
        return 1;
    }
    return [self.wallet moneysCountFromType:section] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self.wallet moneyTypes] == section){
        return @"Total Wallet";
    }
    return [self.wallet moneyTypeForIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // Crear la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    APMoney* money;
    NSString* stringValue;
    
    if ([self.wallet moneyTypes] == indexPath.section){
        
        money = [self.wallet reduceToCurrency:@"EUR" withBroker:self.broker];
        
        UIColor *color = [UIColor blueColor];
        cell.backgroundColor =  color;
        [cell.textLabel setFont:[UIFont boldSystemFontOfSize:18]];
        stringValue = [NSString stringWithFormat:@"Total %@ %@", money.currency, [money.amount stringValue]];
    }
    else
    {
        if([self.wallet moneysCountFromType:indexPath.section] == indexPath.row){
            money = [self.wallet sumForSameCurrency:[self.wallet moneyTypeForIndex:indexPath.section]];
            
            UIColor *color = [UIColor purpleColor];
            cell.backgroundColor =  color;
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:14]];
            stringValue = [NSString stringWithFormat:@"%@ %@", money.currency, [money.amount stringValue]];
            
        }else{
            money=[self.wallet moneyForIndex:indexPath.row moneyTypes:indexPath.section];
            stringValue= [money.amount stringValue];
        }
        
    }

    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = stringValue;
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

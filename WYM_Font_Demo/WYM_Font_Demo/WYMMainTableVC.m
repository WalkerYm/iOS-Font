//
//  WYMMainTableVC.m
//  WYM_Font_Demo
//
//  Created by WalkerYm on 2017/7/3.
//  Copyright © 2017年 WalkerYm. All rights reserved.
//

#import "WYMMainTableVC.h"

static NSString * const kTableViewCellReuseIdentifier = @"cell";

@interface WYMMainTableVC ()

@property (nonatomic, strong) NSArray *subVCArray;
@property (nonatomic, strong) NSArray *subVCTitleArray;

@end

@implementation WYMMainTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"文字";
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.subVCArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewCellReuseIdentifier];
    }
    
    cell.textLabel.text = self.subVCTitleArray[indexPath.row];
    cell.detailTextLabel.text = self.subVCArray[indexPath.row];
    NSLog(@"%@",cell.textLabel.font.familyName);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


#pragma mark - TableView Delegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *subVCString = self.subVCArray[indexPath.row];
    UIViewController *subVC = [NSClassFromString(subVCString) new];
    subVC.navigationItem.title = self.subVCTitleArray[indexPath.row];
    [self.navigationController pushViewController:subVC animated:YES];
}

#pragma mark - Lazy Load
- (NSArray *)subVCArray{

    if (!_subVCArray) {
        _subVCArray = @[
                        @"WYMSystemFontVC",
                        @"WYMCustomFontVC"
                        ];
    }
    
    return _subVCArray;
}

- (NSArray *)subVCTitleArray{
    
    if (!_subVCTitleArray) {
        _subVCTitleArray = @[
                             @"系统文字",
                             @"自定义文字"
                             ];
    }
    return _subVCTitleArray;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

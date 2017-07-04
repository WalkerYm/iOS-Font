//
//  WYMSystemFontVC.m
//  WYM_Font_Demo
//
//  Created by WalkerYm on 2017/7/3.
//  Copyright © 2017年 WalkerYm. All rights reserved.
//

#import "WYMSystemFontVC.h"

static NSString * const kTableViewCellReuseIdentifier = @"cell";

@interface WYMSystemFontVC ()

@property (nonatomic, strong) NSArray *fontArray;

@end

/**
 *  系统字体：82种
 */



@implementation WYMSystemFontVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    

    NSMutableArray *allFontArray = (NSMutableArray *)[UIFont familyNames];
    [allFontArray removeObjectsInArray:@[
                                        @"Boston Traffic",
                                        @"Bronx Bystreets",
                                        @"D Day Stencil",
                                        @"Grenade Stencil",
                                        @"Top Secret Stamp",
                                        @"Urban Sketch",
                                        @"War Wound"
                                        ]];
    
    self.fontArray = [allFontArray copy];
    NSLog(@"字体：%@, 数量：%d", self.fontArray, (int)self.fontArray.count);
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.fontArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kTableViewCellReuseIdentifier];
    }
    
    NSString *fontName = self.fontArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:fontName size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%d %@", (int)indexPath.row + 1, fontName];
    
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

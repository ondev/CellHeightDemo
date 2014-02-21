//
//  T2ViewController.m
//  CellHeightDemo
//
//  Created by Haven on 20/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import "T2ViewController.h"
#import "C2.h"

@interface T2ViewController ()

@end

@implementation T2ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"C2" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"C2"];
    
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"C2"];
    self.tableData =  @[@"1\n2\n3\n4\n5\n6", @"123456789012345678901234567890", @"1\n2", @"1\n2\n3", @"1"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C2 *cell = [self.tableView dequeueReusableCellWithIdentifier:@"C2"];
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    C2 *cell = (C2 *)self.prototypeCell;
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    CGSize s = cell.t.contentSize; //contentSize 在autolayout下，与它的frame相关
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGSize textViewSize = [cell.t sizeThatFits:CGSizeMake(cell.t.frame.size.width, FLT_MAX)];
    CGFloat h = size.height + textViewSize.height;
    h = h > 89 ? h : 89;  //89是图片显示的最低高度， 见xib
    NSLog(@"h=%f", h);
    return 1 + h;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 66;
//}

@end

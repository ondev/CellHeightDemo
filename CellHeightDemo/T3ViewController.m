//
//  T3ViewController.m
//  CellHeightDemo
//
//  Created by Haven on 20/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import "T3ViewController.h"
#import "C3.h"
#import "NSString+Ext.h"

@interface T3ViewController ()

@end

@implementation T3ViewController

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

    
    UINib *cellNib = [UINib nibWithNibName:@"C3" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"C3"];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"C3"];
    
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
    C3 *cell = [self.tableView dequeueReusableCellWithIdentifier:@"C3"];
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    [cell.t sizeToFit];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    C3 *cell = (C3 *)self.prototypeCell;
    NSString *str = [self.tableData objectAtIndex:indexPath.row];
    cell.t.text = str;
    CGSize s = [str calculateSize:CGSizeMake(cell.t.frame.size.width, FLT_MAX) font:cell.t.font];
    CGFloat defaultHeight = cell.contentView.frame.size.height;
    CGFloat height = s.height > defaultHeight ? s.height : defaultHeight;
    NSLog(@"h=%f", height);
    return 1  + height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

@end

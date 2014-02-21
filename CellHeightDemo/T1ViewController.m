//
//  T1ViewController.m
//  CellHeightDemo
//
//  Created by Haven on 20/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import "T1ViewController.h"
#import "C1.h"

@interface T1ViewController ()

@end

@implementation T1ViewController

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
    UINib *cellNib = [UINib nibWithNibName:@"C1" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"C1"];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"C1"];
    
    C1 *c = [[[NSBundle mainBundle] loadNibNamed:@"C1" owner:self options:nil] objectAtIndex:0];
    
    CGSize size = [c.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"h=%f", size.height);
    
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
    C1 *cell = [self.tableView dequeueReusableCellWithIdentifier:@"C1"];
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    C1 *cell = (C1 *)self.prototypeCell;
    cell.translatesAutoresizingMaskIntoConstraints = NO;
    cell.t.translatesAutoresizingMaskIntoConstraints = NO;
    cell.i.translatesAutoresizingMaskIntoConstraints = NO;
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"h=%f", size.height + 1);
    return 1  + size.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

@end

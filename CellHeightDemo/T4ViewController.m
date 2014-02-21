//
//  T4ViewController.m
//  CellHeightDemo
//
//  Created by Haven on 20/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import "T4ViewController.h"
#import "C4.h"

@interface T4ViewController ()

@end

@implementation T4ViewController

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
    
    UINib *cellNib = [UINib nibWithNibName:@"C4" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"C4"];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"C4"];
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
    C4 *cell = [self.tableView dequeueReusableCellWithIdentifier:@"C4"];
    cell.t.text = [self.tableData objectAtIndex:indexPath.row];
    [cell.t sizeToFit];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    C4 *cell = (C4 *)self.prototypeCell;
    NSString *str = [self.tableData objectAtIndex:indexPath.row];
    cell.t.text = str;
    CGSize s =  [cell.t sizeThatFits:CGSizeMake(cell.t.frame.size.width, FLT_MAX)];
    CGFloat defaultHeight = cell.contentView.frame.size.height;
    CGFloat height = s.height > defaultHeight ? s.height : defaultHeight;
    return 1  + height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end

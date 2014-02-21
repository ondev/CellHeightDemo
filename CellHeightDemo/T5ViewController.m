//
//  T5ViewController.m
//  CellHeightDemo
//
//  Created by Haven on 21/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import "T5ViewController.h"
#import "C5.h"

@interface T5ViewController ()<UITextViewDelegate>
@property (nonatomic, weak) NSString *updatedStr;
@end

@implementation T5ViewController

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

    UINib *cellNib = [UINib nibWithNibName:@"C5" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"C5"];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"C5"];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C5 *cell = [self.tableView dequeueReusableCellWithIdentifier:@"C5"];
    cell.t.text = @"123";
    cell.t.delegate = self;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    C5 *cell = (C5 *)self.prototypeCell;
    cell.t.text = self.updatedStr;
    CGSize s =  [cell.t sizeThatFits:CGSizeMake(cell.t.frame.size.width, FLT_MAX)];
    CGFloat defaultHeight = cell.contentView.frame.size.height;
    CGFloat height = s.height > defaultHeight ? s.height : defaultHeight;
    return 1  + height;
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        NSLog(@"h=%f", textView.contentSize.height);
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.updatedStr = textView.text;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end

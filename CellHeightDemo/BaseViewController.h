//
//  BaseViewController.h
//  CellHeightDemo
//
//  Created by Haven on 20/2/14.
//  Copyright (c) 2014 LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UITableViewController

@property (nonatomic, strong) UITableViewCell *prototypeCell;
@property (nonatomic, strong) NSArray *tableData;
@end

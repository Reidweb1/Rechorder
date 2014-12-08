//
//  SongDetailViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "SongDetailViewController.h"
#import "SongDetailTableViewCell.h"

@interface SongDetailViewController ()

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongDetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"VIEW_SONG_TABLE_CELL"];
    cell.sectionLabel.text = @"TEST";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

@end

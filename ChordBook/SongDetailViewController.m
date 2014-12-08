//
//  SongDetailViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "SongDetailViewController.h"
#import "SongDetailTableViewCell.h"
#import "CDSection.h"

@interface SongDetailViewController ()

@property (strong,nonatomic) NSArray *sectionNames;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.sectionNames = @[@"Intro:", @"Verse:", @"Chorus:", @"Bridge"];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongDetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"VIEW_SONG_TABLE_CELL"];
    cell.sectionLabel.text = [self.sectionNames objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.selectedSong.sections count];
}

@end

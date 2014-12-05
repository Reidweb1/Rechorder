//
//  ChooseChordsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChooseChordsViewController.h"
#import "SectionTableViewCell.h"

@interface ChooseChordsViewController ()

@property (strong, nonatomic) NSMutableArray *includedSections;

@end

@implementation ChooseChordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.includedSections = [[NSMutableArray alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    int index = 0;
    for (NSString *sectionName in self.sections) {
        if (![sectionName isEqualToString:@"NULL"]) {
            [self.includedSections insertObject:sectionName atIndex:index];
            index++;
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SectionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SECTION_CELL"];
    cell.sectionLabel.text = [self.includedSections objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.includedSections count];
}

@end

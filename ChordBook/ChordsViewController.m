//
//  ChordsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordsViewController.h"
#import "ChordTableSeeder.h"

@interface ChordsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ChordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[ChordTableSeeder seeder].rootNotes count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ChordTableSeeder seeder].chords[1] count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHORD_CELL" forIndexPath:indexPath];
    cell.textLabel.text = [ChordTableSeeder seeder].chords[indexPath.section][indexPath.row];
    return cell;
}


@end

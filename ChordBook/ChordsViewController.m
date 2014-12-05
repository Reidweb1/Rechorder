//
//  ChordsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordsViewController.h"
#import "ChordTableSeeder.h"
#import "ChordDetailViewController.h"

@interface ChordsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *currentChordName;
@property (strong, nonatomic) UIImage *currentChordImage;

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentChordName = [ChordTableSeeder seeder].chords[indexPath.section][indexPath.row];
    self.currentChordImage = [[ChordTableSeeder seeder].photos valueForKey:self.currentChordName];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CHORD_DETAIL"]) {
        ChordDetailViewController *destinationVC = [segue destinationViewController];
        destinationVC.chordImageView.image = self.currentChordImage;
        destinationVC.chordNameLabel.text = self.currentChordName;
    }
    
}


@end

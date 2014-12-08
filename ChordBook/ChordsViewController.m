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
#import "Chord.h"
#import "AppDelegate.h"

@interface ChordsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *currentChordName;
@property (strong, nonatomic) UIImage *currentChordImage;
@property (strong, nonatomic) Chord *currentChord;

@end

@implementation ChordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    UIImage *tabBarImage = [UIImage imageNamed:@"Fret"];
//    tabBarImage = [tabBarImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *tabBarSelectedImage = [UIImage imageNamed:@"Note"];
//    tabBarSelectedImage = [tabBarSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Chords" image:tabBarImage selectedImage:tabBarSelectedImage];
//    self.tabBarItem.image = tabBarImage;
//    self.tabBarItem.selectedImage = tabBarSelectedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ChordTableSeeder seeder].chordObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHORD_CELL" forIndexPath:indexPath];
    Chord *chord = [ChordTableSeeder seeder].chordObjects[indexPath.row];
    cell.textLabel.text = chord.chordName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentChord = [ChordTableSeeder seeder].chordObjects[indexPath.row];
    [self performSegueWithIdentifier:@"CHORD_DETAIL" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CHORD_DETAIL"]) {
        ChordDetailViewController *destinationVC = [segue destinationViewController];
        destinationVC.chord = self.currentChord;
    }
    
}


@end

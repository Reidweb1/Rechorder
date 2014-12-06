//
//  ChooseChordsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChooseChordsViewController.h"
#import "SectionTableViewCell.h"
#import "ChordPickerViewController.h"
#import "CoreDataController.h"

@interface ChooseChordsViewController ()

@property (strong, nonatomic) NSMutableArray *includedSections;
@property (strong, nonatomic) SectionTableViewCell *currentSection;

@end

@implementation ChooseChordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonPressed:)];
    self.includedSections = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addChordPressed:) name: @"ADD_CHORD_FOR_SECTION" object:nil];
    
    if ([[self.sections objectForKey:@"Intro:"] isEqualToString:@"On"]) {
        [self.includedSections addObject:@"Intro:"];
    }
    if ([[self.sections objectForKey:@"Verse:"] isEqualToString:@"On"]) {
        [self.includedSections addObject:@"Verse:"];
    }
    if ([[self.sections objectForKey:@"Chorus:"] isEqualToString:@"On"]) {
        [self.includedSections addObject:@"Chorus:"];
    }
    if ([[self.sections objectForKey:@"Bridge:"] isEqualToString:@"On"]) {
        [self.includedSections addObject:@"Bridge:"];
    }
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.currentSection) {
        [self.currentSection.collectionView reloadData];
    }
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

- (void) addChordPressed:(NSNotification *)notification {
    NSLog(@"ChordButtonPressed");
    if ([notification.object isMemberOfClass:([SectionTableViewCell class])]) {
        self.currentSection = notification.object;
    } else {
        NSLog(@"ERROR: Notification Center on Choose Chord VC");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SHOW_CHORD_PICKER"]) {
        ChordPickerViewController *destinationVC = segue.destinationViewController;
        destinationVC.senderCell = self.currentSection;
    }
}

- (void) saveButtonPressed:(id)sender {
    NSLog(@"Save Button Pressed");
    
}

@end

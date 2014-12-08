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
#import "CDChord.h"

@interface SongDetailViewController ()

@property (strong, nonatomic) NSArray *sectionNames;
@property (strong, nonatomic) NSDictionary *orderedSectionsWithChords;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.sectionNames = @[@"Intro:", @"Verse:", @"Chorus:", @"Bridge"];
    self.orderedSectionsWithChords = [[NSDictionary alloc] init];
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

- (void) sortSections {
    for (CDSection *section in self.selectedSong.sections) {
        if ([section.sectionName isEqualToString:@"Intro:"]) {
            [self.orderedSectionsWithChords setValue:[self sortChords:section] forKey:@"Intro:"];
        } else if ([section.sectionName isEqualToString:@"Verse:"]) {
            [self.orderedSectionsWithChords setValue:[self sortChords:section] forKey:@"Verse:"];
        } else if ([section.sectionName isEqualToString:@"Chorus:"]) {
            [self.orderedSectionsWithChords setValue:[self sortChords:section] forKey:@"Chorus:"];
        } else if ([section.sectionName isEqualToString:@"Bridge:"]) {
            [self.orderedSectionsWithChords setValue:[self sortChords:section] forKey:@"Bridge:"];
        }
    }
}

- (NSMutableArray *) sortChords:(CDSection *)section {
    NSMutableArray *orderedChords = [[NSMutableArray alloc] init];
    for (CDChord *chord in section.chords) {
        [orderedChords insertObject:chord atIndex: [chord.index intValue]];
    }
    return orderedChords;
}

@end

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
@property (strong, nonatomic) NSMutableDictionary *orderedSectionsWithChords;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.sectionNames = @[@"Intro:", @"Verse:", @"Chorus:", @"Bridge:"];
    self.orderedSectionsWithChords = [[NSMutableDictionary alloc] init];
    [self sortSections:^{
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongDetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"VIEW_SONG_TABLE_CELL"];
    NSString *rowName = [self getSectionTitle:(int)indexPath.row];
    cell.sectionLabel.text = rowName;
    cell.chordsInSection = [self.orderedSectionsWithChords objectForKey:rowName];
    cell.collectionView.dataSource = cell;
    cell.collectionView.delegate = cell;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.selectedSong.sections count];
}

- (void) sortSections: (void(^)())completion{
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
    completion();
}

- (NSMutableArray *) sortChords:(CDSection *)section {
    NSMutableArray *orderedChords = [[NSMutableArray alloc] init];
    for (int i = 0; i < [section.chords count]; i++) {
        [orderedChords addObject: @""];
    }
    for (CDChord *chord in section.chords) {
        [orderedChords replaceObjectAtIndex:[chord.index intValue] withObject:chord];
    }
    return orderedChords;
}

- (NSString *) getSectionTitle:(int)index {
    NSString *rowName = self.sectionNames[index];
    if (![self.orderedSectionsWithChords objectForKey:rowName]) {
        return [self getSectionTitle:index + 1];
    } else {
        return rowName;
    }
}


@end

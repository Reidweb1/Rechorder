//
//  SectionTableViewCell.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "SectionTableViewCell.h"
#import "ChordCollectionViewCell.h"
#import "Chord.h"
#import "ChordPickerViewController.h"
#import "ChordTableSeeder.h"

@implementation SectionTableViewCell

- (void)awakeFromNib {
    self.chords = [[NSMutableArray alloc] init];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChordCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"SECTION_COLLECTION" forIndexPath:indexPath];
    Chord *chord = [self.chords objectAtIndex:indexPath.row];
    cell.chordLabel.text = chord.chordName;
    cell.chordImageView.image = [[ChordTableSeeder seeder].thumbnailPhotos objectForKey:chord.chordName];
    chord.index = [NSNumber numberWithLong:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self setAlertController: indexPath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.chords count];
}

- (IBAction)addChordButtonPressed:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ADD_CHORD_FOR_SECTION" object: self];
}

- (void) setAlertController: (NSIndexPath *)indexPath {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete?" message:@"Do you want to remove this chord from the section?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:true completion:nil];
        [self.chords removeObjectAtIndex:indexPath.row];
        [self.collectionView reloadData];
    }];
    UIAlertAction *alertDismiss = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:true completion:nil];
    }];
    [alertController addAction: alertAction];
    [alertController addAction: alertDismiss];
    [self.viewController presentViewController:alertController animated:true completion:nil];
}

@end

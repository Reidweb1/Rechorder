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
    cell.chordImageView.image = chord.chordImage;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.chords count];
}

- (IBAction)addChordButtonPressed:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ADD_CHORD_FOR_SECTION" object: self];
}

@end

//
//  SongDetailTableViewCell.m
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "SongDetailTableViewCell.h"
#import "SongCollectionViewCell.h"
#import "CDChord.h"

@implementation SongDetailTableViewCell

- (void)awakeFromNib {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SongCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"SONG_CHORD_CELL" forIndexPath:indexPath];
    CDChord *chord = self.chordsInSection[indexPath.row];
    cell.chordLabel.text = chord.chordName;
    cell.chordImageView.image = [UIImage imageNamed:chord.chordName];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.chordsInSection count];
}

@end

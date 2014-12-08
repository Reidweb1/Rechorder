//
//  ChordPickerViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordPickerViewController.h"
#import "ChordTableSeeder.h"
#import "ChordPickerCollectionViewCell.h"
#import "Chord.h"

@interface ChordPickerViewController ()

@end

@implementation ChordPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[ChordTableSeeder seeder].chordObjects count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChordPickerCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CHORD_PICKER_CELL" forIndexPath:indexPath];
    Chord *chord = [ChordTableSeeder seeder].chordObjects[indexPath.row];
    cell.chordTitleLabel.text = chord.chordName;
    cell.chordImageView.image = chord.chordImage;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Chord *selectedChord = [ChordTableSeeder seeder].chordObjects[indexPath.row];
    selectedChord.index = [NSNumber numberWithInt: *(self.senderCell.counter)];
    [self.senderCell.chords addObject:selectedChord];
    self.senderCell.counter++;
    [self dismissViewControllerAnimated:true completion:nil];
}

@end

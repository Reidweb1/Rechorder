//
//  SectionTableViewCell.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *chords;
@property (assign, nonatomic) int *counter;

@end

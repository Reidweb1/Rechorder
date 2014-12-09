//
//  SongDetailTableViewCell.h
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongDetailTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *chordsInSection;

@end

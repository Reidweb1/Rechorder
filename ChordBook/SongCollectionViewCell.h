//
//  SongCollectionViewCell.h
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *chordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chordImageView;

@end

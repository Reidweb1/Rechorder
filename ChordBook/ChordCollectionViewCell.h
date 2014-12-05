//
//  ChordCollectionViewCell.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChordCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *chordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chordImageView;

@end

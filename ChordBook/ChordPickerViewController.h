//
//  ChordPickerViewController.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionTableViewCell.h"

@interface ChordPickerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

+ (instancetype)picker;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) SectionTableViewCell *senderCell;

@end

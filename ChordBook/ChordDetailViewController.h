//
//  ChordDetailViewController.h
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chord.h"

@interface ChordDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *chordNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chordImageView;
@property (strong, nonatomic) Chord *chord;

@end

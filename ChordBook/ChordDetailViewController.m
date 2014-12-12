//
//  ChordDetailViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordDetailViewController.h"

@interface ChordDetailViewController ()

@end

@implementation ChordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chordImageView.image = self.chord.chordImage;
    self.chordNameLabel.text = self.chord.chordName;
    self.trailingConstraint.constant = self.view.frame.size.width*0.25;
    self.bottomConstraint.constant = self.view.frame.size.width*0.15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

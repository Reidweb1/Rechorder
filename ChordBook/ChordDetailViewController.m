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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

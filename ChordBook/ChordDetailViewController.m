//
//  ChordDetailViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordDetailViewController.h"

@interface ChordDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *chordImageView;
@property (strong, nonatomic) NSLayoutConstraint *imageLeadingConstraint;
@property (strong, nonatomic) NSLayoutConstraint *imageTrailingConstraint;

@end

@implementation ChordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [self setImageViewAndLabel];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)orientationChange:(UIInterfaceOrientation) orientation {
    
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        [UIView animateWithDuration:0.25f animations:^{
            self.chordImageView.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height*.15, self.view.frame.size.width/4, self.view.frame.size.height*0.65);
        }];
    } else if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        [UIView animateWithDuration:0.25f animations:^{
            self.chordImageView.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2);
        }];
    } else {
        NSLog(@"ERROR");
    }
}

- (void)setImageViewAndLabel {
    self.chordNameLabel.text = self.chord.chordName;
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        self.chordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, self.view.frame.size.height/4, self.view.frame.size.height*0.65)];
        self.chordImageView.image = self.chord.chordImage;
        [self.view addSubview:self.chordImageView];
    } else if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        self.chordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2)];
        self.chordImageView.image = self.chord.chordImage;
        [self.view addSubview:self.chordImageView];
    } else {
        NSLog(@"ERROR");
    }
    [self.view addSubview:self.chordImageView];
}

@end

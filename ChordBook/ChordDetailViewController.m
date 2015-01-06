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
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            [UIView animateWithDuration:1.0f animations:^{
                self.chordImageView.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2);
            }];
        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            [UIView animateWithDuration:1.0f animations:^{
                self.chordImageView.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2);
            }];
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}

- (void)setImageViewAndLabel {
    self.chordNameLabel.text = self.chord.chordName;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        self.chordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.height/3, self.view.frame.size.height/2)];
        self.chordImageView.image = self.chord.chordImage;
        [self.view addSubview:self.chordImageView];
    } else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
        self.chordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2)];
        self.chordImageView.image = self.chord.chordImage;
        [self.view addSubview:self.chordImageView];
    } else {
        NSLog(@"ERROR");
    }
    [self.view addSubview:self.chordImageView];
}

@end

//
//  CreateSongViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "CreateSongViewController.h"
#import "ChooseChordsViewController.h"

@interface CreateSongViewController ()

@property (strong, nonatomic) NSMutableArray *sections;

@end

@implementation CreateSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)proceedButtonPressed:(id)sender {
    self.sections = [[NSMutableArray alloc] init];
    if (self.introSwitch.on) {
        [self.sections insertObject:@YES atIndex:0];
    } else {
        [self.sections insertObject:@NO atIndex:0];
    }
    if (self.verseSwitch.on) {
        [self.sections insertObject:@YES atIndex:1];
    } else {
        [self.sections insertObject:@NO atIndex:1];
    }
    if (self.chorusSwitch.on) {
        [self.sections insertObject:@YES atIndex:2];
    } else {
        [self.sections insertObject:@NO atIndex:2];
    }
    if (self.bridgeSwitch.on) {
        [self.sections insertObject:@YES atIndex:3];
    } else {
        [self.sections insertObject:@NO atIndex:3];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CHOOSE_CHORDS"]) {
        ChooseChordsViewController *destinationVC = segue.destinationViewController;
        destinationVC.sections = self.sections;
    }
}

@end

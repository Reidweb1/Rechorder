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
    self.sections = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)proceedButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"CHOOSE_CHORDS" sender:self];
}

- (IBAction)introSwitchPressed:(id)sender {
    if (self.introSwitch.on) {
        [self.sections insertObject:@"Intro:" atIndex:0];
    } else {
        [self.sections insertObject:@"NULL" atIndex:0];
    }
}

- (IBAction)verseSwitchPressed:(id)sender {
    if (self.verseSwitch.on) {
        [self.sections insertObject:@"Verse:" atIndex:1];
    } else {
        [self.sections insertObject:@"NULL" atIndex:1];
    }
}

- (IBAction)chorusSwitchPressed:(id)sender {
    if (self.chorusSwitch.on) {
        [self.sections insertObject:@"Chorus:" atIndex:2];
    } else {
        [self.sections insertObject:@"NULL" atIndex:2];
    }
}

- (IBAction)bridgeSwitchPressed:(id)sender {
    if (self.bridgeSwitch.on) {
        [self.sections insertObject:@"Bridge:" atIndex:3];
    } else {
        [self.sections insertObject:@"NULL" atIndex:3];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CHOOSE_CHORDS"]) {
        ChooseChordsViewController *destinationVC = segue.destinationViewController;
        destinationVC.sections = self.sections;
    }
}

@end

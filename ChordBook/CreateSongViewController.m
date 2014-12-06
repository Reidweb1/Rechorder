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

@property (strong, nonatomic) NSMutableDictionary *sections;

@end

@implementation CreateSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.songTitleTextField.delegate = self;
    self.sections = [[NSMutableDictionary alloc] init];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnScreen)];
    [self.view addGestureRecognizer: gesture];
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
        [self.sections setValue:@"On" forKey:@"Intro:"];
    } else {
        [self.sections setValue:@"Off" forKey:@"Intro:"];
    }
}

- (IBAction)verseSwitchPressed:(id)sender {
    if (self.verseSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Verse:"];
    } else {
        [self.sections setValue:@"Off" forKey:@"Verse:"];
    }
}

- (IBAction)chorusSwitchPressed:(id)sender {
    if (self.chorusSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Chorus:"];
    } else {
        [self.sections setValue:@"Off" forKey:@"Chorus:"];
    }
}

- (IBAction)bridgeSwitchPressed:(id)sender {
    if (self.bridgeSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Bridge:"];
    } else {
        [self.sections setValue:@"Off" forKey:@"Bridge:"];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CHOOSE_CHORDS"]) {
        ChooseChordsViewController *destinationVC = segue.destinationViewController;
        destinationVC.sections = self.sections;
        destinationVC.navigationItem.title = self.songTitleTextField.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.songTitleTextField resignFirstResponder];
    return true;
}

- (void) tappedOnScreen {
    [self.songTitleTextField resignFirstResponder];
}

@end

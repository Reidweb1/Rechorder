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

int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.songTitleTextField.delegate = self;
    self.sections = [[NSMutableDictionary alloc] init];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnScreen)];
    [self.view addGestureRecognizer: gesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    count = 0;
    self.songTitleTextField.text = @"";
    self.introSwitch.on = false;
    self.verseSwitch.on = false;
    self.chorusSwitch.on = false;
    self.bridgeSwitch.on = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)proceedButtonPressed:(id)sender {
    if (count > 0 && ![self.songTitleTextField.text isEqualToString:@""]) {
        [self performSegueWithIdentifier:@"CHOOSE_CHORDS" sender:self];
    } else {
        if (count == 0 && ![self.songTitleTextField.text isEqualToString:@""]) {
            [self setAlertController:@"Add a Section" andMessage:@"You Need at Least One Section to Continue"];
        } else if (count > 0 && [self.songTitleTextField.text isEqualToString:@""]) {
            [self setAlertController:@"Add a Title" andMessage:@"You Need a Song Title to Continue"];
        } else {
            [self setAlertController:@"Add Title and Section" andMessage:@"You Need a Title and a Section to Continue"];
        }
    }
}

#pragma mark - UISwitch IBActions

- (IBAction)introSwitchPressed:(id)sender {
    if (self.introSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Intro:"];
        count += 1;
        NSLog(@"%d", count);
    } else {
        [self.sections setValue:@"Off" forKey:@"Intro:"];
        count -= 1;
        NSLog(@"%d", count);
    }
}

- (IBAction)verseSwitchPressed:(id)sender {
    if (self.verseSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Verse:"];
        count += 1;
        NSLog(@"%d", count);
    } else {
        [self.sections setValue:@"Off" forKey:@"Verse:"];
        count -= 1;
        NSLog(@"%d", count);
    }
}

- (IBAction)chorusSwitchPressed:(id)sender {
    if (self.chorusSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Chorus:"];
        count += 1;
        NSLog(@"%d", count);
    } else {
        [self.sections setValue:@"Off" forKey:@"Chorus:"];
        count -= 1;
        NSLog(@"%d", count);
    }
}

- (IBAction)bridgeSwitchPressed:(id)sender {
    if (self.bridgeSwitch.on) {
        [self.sections setValue:@"On" forKey:@"Bridge:"];
        count += 1;
        NSLog(@"%d", count);
    } else {
        [self.sections setValue:@"Off" forKey:@"Bridge:"];
        count -= 1;
        NSLog(@"%d", count);
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

#pragma mark - Set Alert Controller Functions

- (void) setAlertController:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:true completion:nil];
    }];
    [alertController addAction: action];
    [self presentViewController:alertController animated:true completion:nil];
}

@end

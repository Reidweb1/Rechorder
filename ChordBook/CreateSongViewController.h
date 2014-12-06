//
//  CreateSongViewController.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateSongViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UISwitch *introSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *verseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *chorusSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *bridgeSwitch;

@end

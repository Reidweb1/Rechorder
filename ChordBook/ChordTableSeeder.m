//
//  ChordTableSeeder.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordTableSeeder.h"
#import "Chord.h"

@implementation ChordTableSeeder

- (instancetype)init {
    self = [super init];
    if (self) {
        self.chords = self.fillChords;
        self.rootNotes = self.fillRoots;
        self.chordObjects = self.fillChordImages;
    }
    return self;
}

+ (instancetype)seeder {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (NSArray *) fillRoots {
    NSArray *roots = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G"];
    return roots;
}

- (NSArray *) fillChords {
    NSArray *chords = @[@[@"A", @"Am"], @[@"B", @"Bm"], @[@"C", @"Cm"], @[@"D", @"Dm"], @[@"E", @"Em"], @[@"F", @"Fm"], @[@"G", @"Gm"]];
    
    return chords;
}

- (NSMutableArray *) fillChordImages {
    NSArray *keys = @[@"A", @"Am", @"B", @"Bm", @"C", @"Cm", @"D", @"Dm", @"E", @"Em", @"F", @"Fm", @"G", @"Gm"];
    NSArray *pics = @[[UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AMinorChord.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]], [UIImage imageNamed: [NSString stringWithFormat:@"AChordLarge.png"]]];
    NSMutableArray *chordObjects = [[NSMutableArray alloc] init];
    for (int i = 0; i < [keys count]; i++) {
        Chord *newChord = [[Chord alloc] init:pics[i] withName:keys[i]];
        [chordObjects insertObject:newChord atIndex:i];
    }
    return chordObjects;
}

@end

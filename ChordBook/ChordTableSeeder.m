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

#pragma mark - Initializer and Sigleton Method

- (instancetype)init {
    self = [super init];
    if (self) {
        self.chordObjects = self.fillChordImages;
        self.thumbnailPhotos = [self createThumbnails:self.chordObjects];
        self.sectionNames = @[@"Intro:", @"Verse:", @"Chorus:", @"Bridge:"];
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

#pragma mark - Creating UIImage Objects

- (NSMutableArray *) fillChordImages {
    NSArray *keys = @[@"A", @"A7", @"Amaj7", @"Am", @"Am7", @"B", @"B7", @"Bm", @"Bb", @"C", @"C7", @"Cmaj7", @"Cm", @"D", @"D7", @"Dmaj7", @"Dm", @"Dm7", @"Db", @"Dbm", @"E", @"E7", @"Em", @"Em7", @"F", @"Fmaj7", @"Fm", @"F#", @"F#m", @"G", @"G7", @"Gm", @"G#m"];
    
    NSArray *pics = @[[UIImage imageNamed:@"A"], [UIImage imageNamed:@"A7"], [UIImage imageNamed:@"Amaj7"], [UIImage imageNamed:@"Am"], [UIImage imageNamed:@"Am7"], [UIImage imageNamed:@"B"], [UIImage imageNamed:@"B7"], [UIImage imageNamed:@"Bm"], [UIImage imageNamed:@"Bb"], [UIImage imageNamed:@"C"], [UIImage imageNamed:@"C7"], [UIImage imageNamed:@"Cmaj7"], [UIImage imageNamed:@"Cm"], [UIImage imageNamed:@"D"], [UIImage imageNamed:@"D7"], [UIImage imageNamed:@"Dmaj7"], [UIImage imageNamed:@"Dm"], [UIImage imageNamed:@"Dm7"], [UIImage imageNamed:@"Db"], [UIImage imageNamed:@"Dbm"], [UIImage imageNamed:@"E"], [UIImage imageNamed:@"E7"], [UIImage imageNamed:@"Em"], [UIImage imageNamed:@"Em7"], [UIImage imageNamed:@"F"], [UIImage imageNamed:@"Fmaj7"], [UIImage imageNamed:@"Fm"], [UIImage imageNamed:@"F#"], [UIImage imageNamed:@"F#m"], [UIImage imageNamed:@"G"], [UIImage imageNamed:@"G7"], [UIImage imageNamed:@"Gm"], [UIImage imageNamed:@"G#m"]];
    
    
    NSMutableArray *chordObjects = [[NSMutableArray alloc] init];
    for (int i = 0; i < [keys count]; i++) {
        Chord *newChord = [[Chord alloc] init:pics[i] withName:keys[i]];
        [chordObjects insertObject:newChord atIndex:i];
    }
    return chordObjects;
}

- (NSMutableDictionary *) createThumbnails:(NSMutableArray *)chords {
    CGSize size = CGSizeMake(75, 125);
    NSMutableDictionary *newPics = [[NSMutableDictionary alloc] init];
    for (__strong Chord *chord in chords) {
        UIImage *image = chord.chordImage;
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, 75, 125)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        [newPics setValue:image forKey:chord.chordName];
        UIGraphicsEndImageContext();
    }
    return newPics;
}

@end

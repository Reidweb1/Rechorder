//
//  ChordTableSeeder.m
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ChordTableSeeder.h"

@implementation ChordTableSeeder

- (instancetype)init {
    self = [super init];
    if (self) {
        self.chords = self.fillChords;
        self.rootNotes = self.fillRoots;
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

@end

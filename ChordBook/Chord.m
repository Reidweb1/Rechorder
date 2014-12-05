//
//  Chord.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "Chord.h"

@implementation Chord

- (instancetype) init:(UIImage*)image withName:(NSString*)name {
    self =[super init];
    if (self) {
        self.chordName = name;
        self.chordImage = image;
    }
    return self;
}

@end

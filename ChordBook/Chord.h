//
//  Chord.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Chord : NSObject

@property (strong, nonatomic) NSString *chordName;
@property (strong, nonatomic) UIImage *chordImage;

- (instancetype) init:(UIImage*)image withName:(NSString*)name;

@end

//
//  ChordTableSeeder.h
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChordTableSeeder : NSObject

+ (instancetype)seeder;

@property (strong, nonatomic) NSArray *rootNotes;
@property (strong, nonatomic) NSArray *chords;
@property (strong, nonatomic) NSMutableDictionary *photos;

@end

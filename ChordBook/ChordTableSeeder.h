//
//  ChordTableSeeder.h
//  ChordBook
//
//  Created by Reid Weber on 12/4/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@interface ChordTableSeeder : NSObject

+ (instancetype)seeder;

@property (strong, nonatomic) NSMutableArray *chordObjects;
@property (strong, nonatomic) NSMutableDictionary *thumbnailPhotos;
@property (strong, nonatomic) NSArray *sectionNames;

@end

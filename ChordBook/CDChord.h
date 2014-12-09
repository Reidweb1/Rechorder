//
//  CDChord.h
//  ChordBook
//
//  Created by Reid Weber on 12/8/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDSection;

@interface CDChord : NSManagedObject

@property (nonatomic, retain) NSString * chordName;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) CDSection *containedInSection;

@end

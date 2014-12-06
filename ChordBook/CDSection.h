//
//  CDSection.h
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDChord, CDSong;

@interface CDSection : NSManagedObject

@property (nonatomic, retain) NSString * sectionName;
@property (nonatomic, retain) NSSet *chords;
@property (nonatomic, retain) CDSong *containedInSong;
@end

@interface CDSection (CoreDataGeneratedAccessors)

- (void)addChordsObject:(CDChord *)value;
- (void)removeChordsObject:(CDChord *)value;
- (void)addChords:(NSSet *)values;
- (void)removeChords:(NSSet *)values;

@end

//
//  CDSong.h
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDSong : NSManagedObject

@property (nonatomic, retain) NSString * songName;
@property (nonatomic, retain) NSSet *sections;
@end

@interface CDSong (CoreDataGeneratedAccessors)

- (void)addSectionsObject:(NSManagedObject *)value;
- (void)removeSectionsObject:(NSManagedObject *)value;
- (void)addSections:(NSSet *)values;
- (void)removeSections:(NSSet *)values;

@end

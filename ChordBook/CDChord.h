//
//  CDChord.h
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDChord : NSManagedObject

@property (nonatomic, retain) NSString * chordName;
@property (nonatomic, retain) NSManagedObject *containedInSection;

@end

//
//  CoreDataController.h
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataController : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) saveSong:(NSString *)song withSections:(NSMutableArray *)sections andChords:(NSMutableArray *)chords;

+ (instancetype)controller;

@end

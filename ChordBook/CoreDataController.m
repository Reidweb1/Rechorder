//
//  CoreDataController.m
//  ChordBook
//
//  Created by Reid Weber on 12/5/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "CoreDataController.h"

@implementation CoreDataController

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)controller {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "RW.ChordBook" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ChordBook" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ChordBook.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void) saveSong:(NSString *)song withSections:(NSMutableArray *)sections andChords:(NSMutableArray *)chords {
    CDSong *newSong = [NSEntityDescription insertNewObjectForEntityForName:@"CDSong" inManagedObjectContext:self.managedObjectContext];
    newSong.songName = song;
    for (NSString *section in sections) {
        CDSection *newSection = [NSEntityDescription insertNewObjectForEntityForName:@"CDSection" inManagedObjectContext:self.managedObjectContext];
        newSection.sectionName = section;
        int countIndex = 0;
        for (NSArray *chordArray in chords) {
            if ([chordArray[0] isEqualToString: newSection.sectionName]) {
                CDChord *newChord = [NSEntityDescription insertNewObjectForEntityForName:@"CDChord" inManagedObjectContext:self.managedObjectContext];
                newChord.chordName = chordArray[1];
                newChord.index = [NSNumber numberWithInt:countIndex];
                [newSection addChordsObject: newChord];
                countIndex += 1;
            }
        }
        [newSong addSectionsObject: newSection];
    }
    [self saveContext];
}

- (NSFetchedResultsController *) fetchUserSongs {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CDSong"];
    request.sortDescriptors = [[NSArray alloc] initWithObjects:[[NSSortDescriptor sortDescriptorWithKey:@"songName" ascending:false]init], nil];
    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath: nil cacheName: nil];
    NSError *error = nil;
    [controller performFetch: &error];
    if (!error) {
        return controller;
    } else {
        NSLog(@"Error on Fetch Request");
        return nil;
    }
}

- (void) deleteSong:(CDSong *)song {
    for (CDSection *section in song.sections) {
        for (CDChord *chord in section.chords) {
            [self.managedObjectContext deleteObject:chord];
        }
        [self.managedObjectContext deleteObject:section];
    }
    [self.managedObjectContext deleteObject:song];
    [self saveContext];
}


@end

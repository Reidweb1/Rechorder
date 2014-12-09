//
//  MySongsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "MySongsViewController.h"
#import "SongDetailViewController.h"
#import "CoreDataController.h"
#import "CDSong.h"

@interface MySongsViewController ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) CDSong *selectedSong;

@end

@implementation MySongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.fetchedResultsController.delegate = self;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self setUpRefreshControl];
    [self performFetchWithCompletion:^{
        NSLog(@"Completed");
        self.tableView.delegate = self;
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performFetchWithCompletion:^{
       self.fetchedResultsController.delegate = self;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SHOW_SONG"]) {
        SongDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.selectedSong = self.selectedSong;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedSong = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"SHOW_SONG" sender:self];
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SONG_CELL"];
    CDSong *song = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = song.songName;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fetchedResultsController.fetchedObjects count];
}

- (void) performFetchWithCompletion:(void(^)())completion {
    self.fetchedResultsController = [[CoreDataController controller] fetchUserSongs];
    completion();
}

- (void) refreshPage:(UIRefreshControl *)refreshControl {
    [self performFetchWithCompletion:^{
        [self.refreshControl endRefreshing];
        self.fetchedResultsController.delegate = self;
    }];
}

- (void) setUpRefreshControl {
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Pull To Refresh"];
    [self.refreshControl setAttributedTitle: title];
    [self.refreshControl addTarget:self action:@selector(refreshPage:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl.superview sendSubviewToBack:self.refreshControl];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CDSong *song = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
        [[CoreDataController controller] deleteSong: song];
        [self performFetchWithCompletion:^{
           NSLog(@"Fetch Completed Post Deletion");
            self.fetchedResultsController.delegate = self;
        }];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

#pragma mark NSFetchedResultsController Delegate Methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case 1:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case 2:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case 3:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case 4:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}



@end

//
//  MySongsViewController.m
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "MySongsViewController.h"
#import "CoreDataController.h"
#import "CDSong.h"

@interface MySongsViewController ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation MySongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self setUpRefreshControl];
    [self performFetchWithCompletion:^{
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

- (void) setUpRefreshControl {
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Pull To Refresh"];
    [self.refreshControl setAttributedTitle: title];
    [self.refreshControl addTarget:self action:@selector(refreshPage:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl.superview sendSubviewToBack:self.refreshControl];
}

@end

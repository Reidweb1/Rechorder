//
//  MySongsViewController.h
//  ChordBook
//
//  Created by Reid Weber on 12/6/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MySongsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

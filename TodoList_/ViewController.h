//
//  ViewController.h
//  TodoList_
//
//  Created by khoa on 8/22/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddListController.h"
#import "EditListController.h"

//@class AddListController;

@interface ViewController : UIViewController<MyCustomDelegate, EditDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mTable;

@end


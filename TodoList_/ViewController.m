//
//  ViewController.m
//  TodoList_
//
//  Created by khoa on 8/22/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import "ViewController.h"
#import "CustomPrototypeCell.h"
#import "AddListController.h"
#import "TodoItem.h"
#import "EditListController.h"

@interface ViewController ()

@end
NSMutableArray *array;
NSMutableArray *filterArray;
long posList;
NSString *currentValue;
int timeList;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //array = [NSMutableArray arrayWithObjects:@"Don Dep",@"Lam Bai Tap",@"Tap The Duc", nil];
    TodoItem *i1 = [[TodoItem alloc] initWithTitle:@"A" AndTimeToComplete:20];
    TodoItem *i2 = [[TodoItem alloc] initWithTitle:@"B" AndTimeToComplete:20];
    TodoItem *i3 = [[TodoItem alloc] initWithTitle:@"C" AndTimeToComplete:20];
    TodoItem *i4 = [[TodoItem alloc] initWithTitle:@"D" AndTimeToComplete:20];
    TodoItem *i5 = [[TodoItem alloc] initWithTitle:@"E" AndTimeToComplete:20];
    TodoItem *i6 = [[TodoItem alloc] initWithTitle:@"F" AndTimeToComplete:20];
    TodoItem *i7 = [[TodoItem alloc] initWithTitle:@"G" AndTimeToComplete:30];
    
    array = [NSMutableArray arrayWithObjects:i1,i2,i3,i4,i5,i6,i7,nil];
    _mTable.dataSource = self;
    _mTable.delegate = self;
    _searchBar.delegate = (id)self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    long rowCount;
    if(self.isFiltered)
    {
        rowCount = filterArray.count;
    }
    else
    {
        rowCount = array.count;
    }
    
    return rowCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomPrototypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCustomTask"];
//    NSString *doItem = [array objectAtIndex:indexPath.row];
//    cell.lblWork.text = doItem;
    TodoItem *tmpItem;
    if(self.isFiltered)
    {
        tmpItem =  [filterArray objectAtIndex:indexPath.row];
    }
    else
    {
        tmpItem = [array objectAtIndex:indexPath.row];
    }
    cell.delegate = self;
    cell.lblWork.text = tmpItem.title;
    cell.lblTime.text = [NSString stringWithFormat:@"%d minute(s)",tmpItem.timeToComplete];
    cell.btnEdit.tag  = indexPath.row;
    return cell;

}

//SearchBar Text Change
-(void)searchBar:(UISearchBar *) searchBar textDidChange:(nonnull NSString *)searchText
{
    if(searchText.length == 0)
    {
        self.isFiltered = false;
    }
    else
    {
        self.isFiltered = true;
        filterArray = [[NSMutableArray alloc] init];
        
        for (int i= 0; i < array.count; i++) {
            NSRange mRange = [array[i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(mRange.location != NSNotFound)
            {
                [filterArray addObject:array[i]];
            }
        }
    }
    [_mTable reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"addSegue"])
    {
        ViewController *VC = segue.destinationViewController;
        AddListController *addController = (AddListController *) VC;
        addController.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"editSeque"])
    {
        ViewController *VC = segue.destinationViewController;
        EditListController *editController =(EditListController *)VC;
        editController.delegate = self;
        
        NSString *task = currentValue;
        int taskTime = timeList;
        long pos = posList;
        
        editController.pos = pos;
        editController.taskTime = taskTime;
        editController.task = task;
        
    }
}
-(void)addList:(NSString *) title Time:(int) time{
    NSString *item =(NSString *)title;
    int Time = time;
    TodoItem *i = [[TodoItem alloc] initWithTitle:item AndTimeToComplete:Time];
    [array addObject:i];
    [_mTable reloadData];
}
-(void) CustomCellDelegateMethod :(CustomPrototypeCell *) sender
{
    posList         = sender.btnEdit.tag;
    currentValue    = sender.lblWork.text;
    timeList        = sender.lblTime.text.intValue;
    [self performSegueWithIdentifier:@"editSeque" sender:self];
}

-(void) getEdit:(NSString *)task Time:(int) time Pos:(long) pos{
    NSString *taskEdit = (NSString *)task;
    int Time = time;
    posList = pos;
    TodoItem *i = [[TodoItem alloc] initWithTitle:taskEdit AndTimeToComplete:Time];
    [array replaceObjectAtIndex:pos withObject:i];
    [_mTable reloadData];
    
}

@end

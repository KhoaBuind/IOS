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
    TodoItem *i1 = [[TodoItem alloc] initWithTitle:@"Don Dep" AndTimeToComplete:20];
    TodoItem *i2 = [[TodoItem alloc] initWithTitle:@"Lam Bai Tap" AndTimeToComplete:30];
    array = [NSMutableArray arrayWithObjects:i1,i2,nil];
    _mTable.dataSource = self;
    _mTable.delegate = self;
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
    rowCount = array.count;
    return rowCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomPrototypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCustomTask"];
//    NSString *doItem = [array objectAtIndex:indexPath.row];
//    cell.lblWork.text = doItem;
    TodoItem *tmpItem =  [array objectAtIndex:indexPath.row];
    cell.delegate = self;
    cell.lblWork.text = tmpItem.title;
    cell.lblTime.text = [NSString stringWithFormat:@"%d minute(s)",tmpItem.timeToComplete];
    cell.btnEdit.tag  = indexPath.row;
    return cell;

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

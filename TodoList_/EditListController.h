//
//  EditListController.h
//  TodoList_
//
//  Created by khoa on 8/25/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditDelegate <NSObject>

-(void) getEdit:(NSString *)task Time:(int) time Pos:(long) pos;

@end

@interface EditListController : UIViewController

@property (weak,nonatomic) id <EditDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *txtTask;
@property (weak, nonatomic) IBOutlet UITextField *txtTime;

@property (strong, nonatomic)NSString *task;
@property (assign, nonatomic)int taskTime;
@property (assign, nonatomic)long pos;


- (IBAction)btnCancelEdit:(id)sender;
- (IBAction)btnDoneEdit:(id)sender;

@end

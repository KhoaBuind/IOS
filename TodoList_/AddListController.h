//
//  AddListController.h
//  TodoList_
//
//  Created by Test on 8/24/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import <UIKit/UIKit.h> 



@protocol MyCustomDelegate <NSObject>

-(void)addList:(NSString *) title Time:(int) time;

@end

@interface AddListController : UIViewController
@property (weak, nonatomic) id <MyCustomDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *txtList;
@property (weak, nonatomic) IBOutlet UITextField *txtTime;

- (IBAction)btnSave:(id)sender;
- (IBAction)btnCancel:(id)sender;


@end

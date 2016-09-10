//
//  CustomPrototypeCell.h
//  TodoList_
//
//  Created by khoa on 8/22/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoItem.h"

@class CustomPrototypeCell;
@protocol CustomCellDelegate <NSObject>

-(void) CustomCellDelegateMethod :(CustomPrototypeCell *) sender;

@end

@interface CustomPrototypeCell : UITableViewCell

@property (weak, nonatomic) id <CustomCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *lblWork;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIButton *btnCheck;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
- (IBAction)btnEdit:(id)sender;

@end

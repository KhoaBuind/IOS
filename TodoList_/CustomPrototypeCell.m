//
//  CustomPrototypeCell.m
//  TodoList_
//
//  Created by khoa on 8/22/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import "CustomPrototypeCell.h"

@implementation CustomPrototypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnEdit:(id)sender {
    
    [self.delegate CustomCellDelegateMethod:self];
}
@end

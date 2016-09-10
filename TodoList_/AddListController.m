//
//  AddListController.m
//  TodoList_
//
//  Created by Test on 8/24/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import "AddListController.h"


@interface AddListController ()

@end

@implementation AddListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(id)sender {
    [self.delegate addList:_txtList.text Time:_txtTime.text.intValue];
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)btnCancel:(id)sender
{
    [[self navigationController] popViewControllerAnimated:NO];
}
@end

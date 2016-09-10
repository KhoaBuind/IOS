//
//  EditListController.m
//  TodoList_
//
//  Created by khoa on 8/25/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import "EditListController.h"


@interface EditListController ()

@end

@implementation EditListController
@synthesize task,taskTime,pos;

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtTask.text = task;
    _txtTime.text = [NSString stringWithFormat:@"%d",taskTime];
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

- (IBAction)btnCancelEdit:(id)sender {
    [[self navigationController]popViewControllerAnimated:YES];
}

- (IBAction)btnDoneEdit:(id)sender {
    if ([_txtTask.text isEqualToString:@""]) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"message:@"Please Insert Task Nam" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Okiii®" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        //Handle your yes please button action here
        }];
        
        [alert addAction:yesButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    [self.delegate getEdit:_txtTask.text Time:_txtTime.text.intValue Pos:pos];
    [[self navigationController]popViewControllerAnimated:YES];
}
@end

//
//  TodoItem.h
//  TodoList_
//
//  Created by Test on 8/24/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property (strong,nonatomic) NSString *title;
@property (assign, nonatomic) int timeToComplete;

-(id) initWithTitle:(NSString *) title AndTimeToComplete:(int) time;
@end

//
//  TodoItem.m
//  TodoList_
//
//  Created by Test on 8/24/16.
//  Copyright © 2016 KhoaBui. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

-(id) initWithTitle:(NSString *)title AndTimeToComplete:(int)time
{
    if(self = [super init])
    {
        self.title = title;
        self.timeToComplete = time;
    }
    
    return self;
}

@end

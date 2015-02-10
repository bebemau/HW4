//
//  TodoItem.m
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

static NSString *const keyName = @"name";

+(instancetype)TodoItemName:(NSString*)name
{
    //no need super init since init takes care of it
    TodoItem *object = [[self alloc] init];
    object.name = name;
    return object;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:keyName];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self)
    {
        self.name  = [aDecoder decodeObjectForKey:keyName];
    }
    return self;
}

@end

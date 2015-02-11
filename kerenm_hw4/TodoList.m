//
//  TodoList.m
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "TodoList.h"

@implementation TodoList

static NSString *keyTodoList = @"TodoListKey";

+(instancetype)initWithTitle:(NSString*)title
{
    TodoList *object = [[self alloc] init];
    object.todoListTitle = title;
    return object;
}

-(void)addItem:(TodoItem*)item {
    // insert item if OK
    
    BOOL canAdd = false;
    
    if([self hasItemWithTitle:item.name])
    {
        if(self.todoListAllowDuplicates)
        {
            canAdd = true;
        }
        else
        {
            canAdd = false;
        }
    }
    else
    {
        canAdd  = true;
    }
    
    if(canAdd)
    {
        if(self.todoListArray == nil)
        {
            self.todoListArray = [[NSMutableArray alloc]init];
        }
       [self.todoListArray addObject:item];
    }
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.todoListArray forKey:keyTodoList];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self)
    {
        self.todoListArray  = [aDecoder decodeObjectForKey:keyTodoList];
    }
    return self;
}


-(BOOL)hasItemWithTitle:(NSString*)title{
    // check if any item contained already has same title
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name ==[cd] %@", title];
    NSArray *filtered = [self.todoListArray filteredArrayUsingPredicate:predicate];
    
    if(filtered.count > 0)
        return true;
    else
        return false;
}


-(NSUInteger)itemCount{
    return self.todoListArray.count;
}

-(TodoItem*)getItemByIndex: (NSUInteger)rowIndex{
    return [self.todoListArray objectAtIndex:(NSUInteger)rowIndex];
}

-(void)saveItem:(TodoItem*)item  selectedRowIndex: (NSInteger)index{
    [self.todoListArray replaceObjectAtIndex:index withObject:item];
}

-(void)removeItemAtIndex:(NSInteger)index{
    [self.todoListArray removeObjectAtIndex:index];
}

@end

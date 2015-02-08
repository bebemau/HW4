//
//  TodoList.m
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "TodoList.h"

@implementation TodoList

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
        if(self._allowDuplicates)
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
        if(self._todoList == nil)
        {
            self._todoList = [[NSMutableArray alloc]init];
        }
       [self._todoList addObject:item];
    }
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self._todoList forKey:@"mytodoListKey"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self)
    {
        self._todoList  = [aDecoder decodeObjectForKey:@"mytodoListKey"];
    }
    return self;
}


-(BOOL)hasItemWithTitle:(NSString*)title{
    // check if any item contained already has same title
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name ==[cd] %@", title];
    NSArray *filtered = [self._todoList filteredArrayUsingPredicate:predicate];
    
    if(filtered.count > 0)
        return true;
    else
        return false;
}


-(NSUInteger)itemCount{
    NSLog(@"item count at itemCount: %ld", self._todoList.count);
    return self._todoList.count;
}

-(TodoItem*)getItemByIndex: (NSUInteger)rowIndex{
    return [self._todoList objectAtIndex:(NSUInteger)rowIndex];
}

-(void)saveItem:(TodoItem*)item  selectedRowIndex: (NSInteger)index{
    [self._todoList replaceObjectAtIndex:index withObject:item];
}

-(void)removeItemAtIndex:(NSInteger)index{
    
    [self._todoList removeObjectAtIndex:index];
}

@end

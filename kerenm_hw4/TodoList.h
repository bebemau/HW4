//
//  TodoList.h
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface TodoList : NSObject <NSCoding>
@property (nonatomic, readwrite) BOOL todoListAllowDuplicates;
@property (nonatomic, readwrite) NSMutableArray *todoListArray;
@property (nonatomic, readwrite) NSString *todoListTitle;

-(void)addItem:(TodoItem*)item;    // insert item if OK
-(void)removeItemAtIndex:(NSInteger)index;
//-(void)canAddItem:(BOOL)value;
-(TodoItem*)getItemByIndex: (NSUInteger)index;
-(BOOL)hasItemWithTitle:(NSString*)title; // check if any item contained already has same title
-(NSUInteger)itemCount; // number of items contained in list
//-(instancetype)initWithTitle:(NSString*)title;
-(void)saveItem:(TodoItem*)item  selectedRowIndex: (NSInteger)index;
@end

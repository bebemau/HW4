//
//  ViewController.h
//  kerenm_hw4
//
//  Created by Man, Keren on 2/5/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <
NSTableViewDataSource,
NSTableViewDelegate,
NSTextFieldDelegate,
NSTextViewDelegate
>
@property (weak) IBOutlet NSTextField *txtTodoItemDetail;
@property (weak) IBOutlet NSTableView *tblTodoList;
@property (weak) IBOutlet NSTextField *txtTodoItem;
@property (weak) IBOutlet NSButton *btnAdd;
@property (weak) IBOutlet NSButton *btnRemove;
@property (nonatomic) NSInteger rowIndex;
@property (strong) IBOutlet TodoList *viewControllerList;
@end


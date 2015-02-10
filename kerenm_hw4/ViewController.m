//
//  ViewController.m
//  kerenm_hw4
//
//  Created by Man, Keren on 2/5/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Keren's TodoList";

    //todoList
    self.viewControllerList = [[TodoList alloc ]init];
    self.viewControllerList.todoListAllowDuplicates = YES;
    
    //txtTodoItem
    self.txtTodoItem.font = [NSFont fontWithName:@"Courier" size:20.0];
    self.txtTodoItem.delegate = self;
    
    //tblTodoList
    self.tblTodoList.delegate = self;
    self.tblTodoList.dataSource = self;
    self.tblTodoList.rowHeight = 50;
    [self.tblTodoList setHeaderView:nil];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    
    TodoItem *item = [TodoItem new];
    item.name = self.txtTodoItem.stringValue;
    [self.viewControllerList saveItem: item selectedRowIndex: self.rowIndex];
    [self.tblTodoList reloadData];
    
}

- (void)tableViewSelectionIsChanging:(NSNotification *)aNotification{
    if(self.tblTodoList.selectedRow != -1) {
        self.rowIndex = self.tblTodoList.selectedRow;
        self.txtTodoItem.stringValue = [self.viewControllerList getItemByIndex:(NSUInteger)self.rowIndex].name;
        self.btnRemove.enabled = YES;
    }
    else{
        self.btnRemove.enabled= NO;
    }
}

-(NSView*)tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)rowIndex
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"tableCellID" owner:nil];
    cell.textField.stringValue=@(rowIndex).stringValue;
    //NSLog(@"rowindex %ld", (long)rowIndex);
    NSLog(@"rowindex at viewForTableColumn %ld", (NSUInteger)rowIndex);
    cell.textField.stringValue =[self.viewControllerList getItemByIndex:(NSUInteger)rowIndex].name;
    return cell;
}

-(NSInteger)   numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.viewControllerList itemCount];
}

- (IBAction)btnAdd_Click:(id)sender {
    //tried putting this in viewDidLoad but didnt work
    self.viewControllerList.todoListAllowDuplicates = YES;
    TodoItem *item = [TodoItem new];
    item.name  = @"New Item";
    [self.viewControllerList addItem:item];
    [self.tblTodoList reloadData];
}

- (IBAction)btnRemove_Clicked:(id)sender {
    [self.viewControllerList removeItemAtIndex:self.rowIndex];
    [self.tblTodoList reloadData];
    self.txtTodoItem.stringValue = @"";
}

@end

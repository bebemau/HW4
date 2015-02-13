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
    [self.txtTodoItem setFocusRingType:NSFocusRingTypeNone];
    self.txtTodoItem.font = [NSFont fontWithName:@"Courier" size:20.0];
    self.txtTodoItem.delegate = self;
    [self.txtTodoItem setBackgroundColor:[NSColor lightGrayColor]];
    [self.txtTodoItem setBordered:NO];

    //txtTodoItemDetail
    self.txtTodoItemDetail.delegate = self;
    self.txtTodoItemDetail.font = [NSFont fontWithName:@"Courier" size:20.0];
    [self.txtTodoItemDetail setFocusRingType:NSFocusRingTypeNone];
    //[self.txtTodoItemDetail setBordered:NO];
    
    //tblTodoList
    self.tblTodoList.delegate = self;
    self.tblTodoList.dataSource = self;
    self.tblTodoList.rowHeight = 50;
    [self.tblTodoList setHeaderView:nil];
    [self.tblTodoList setAllowsMultipleSelection:YES];
    
    //button
    self.btnRemove.enabled = NO;
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSLog(@"controlTextDidChange called");
    [self SaveAfterTextChanged];
}

-(void)textDidChange:(NSNotification *)notification {
    NSLog(@"textDidChange called");
    [self SaveAfterTextChanged];
}

-(void)SaveAfterTextChanged{
    TodoItem *item = [TodoItem new];
    item.name = self.txtTodoItem.stringValue;
    NSString *detailText = [self.txtTodoItemDetail string];
    item.itemDetail = detailText;
    //[self.viewControllerList writeAllArrayItems:@"SaveAfterTextChanged before saving"];
    [self.viewControllerList saveItem: item selectedRowIndex: self.rowIndex];
    [self.tblTodoList reloadData];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification{
    NSIndexSet *indexSet = self.tblTodoList.selectedRowIndexes;
    if(indexSet.count >= 1){
        self.btnRemove.enabled = YES;
        
        if(indexSet.count >1){
            self.txtTodoItem.stringValue = @"";
            [self.txtTodoItemDetail setString: @""];
            //self.txtTodoItemDetail.stringValue =@"";
        }
        else{
            self.rowIndex = self.tblTodoList.selectedRow;
            self.txtTodoItem.stringValue = [self.viewControllerList getItemByIndex:(NSUInteger)self.rowIndex].name;
            [self.txtTodoItemDetail setString:[self.viewControllerList getItemByIndex:(NSUInteger)self.rowIndex].itemDetail];
        }
    }
    else{
        self.btnRemove.enabled= NO;
    }
}


-(NSView*)tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)rowIndex
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"tableCellID" owner:nil];
    cell.textField.stringValue=@(rowIndex).stringValue;
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
    item.itemDetail =@"";
    [self.viewControllerList addItem:item];
    [self.tblTodoList reloadData];
}

- (IBAction)btnRemove_Clicked:(id)sender {
    BOOL didRemove = NO;
    NSIndexSet *indexSet = self.tblTodoList.selectedRowIndexes;
    
    //indexSet.count will be zero if focus is on any of the text fields
    if(indexSet.count == 0){
        [self.viewControllerList removeItemAtIndex:self.rowIndex];
        didRemove = YES;
    }
    else{
        NSUInteger idx = [indexSet lastIndex];
        while (idx != NSNotFound)
        {
            NSLog (@"The current index is %lu", (unsigned long)idx);
            [self.viewControllerList removeItemAtIndex:idx];
            // get the next index
            idx = [indexSet indexLessThanIndex:idx];
        }
        didRemove = YES;
    }
    
    [self.tblTodoList reloadData];
    self.txtTodoItem.stringValue = @"";
    [self.txtTodoItemDetail setString:@""];
    if(didRemove)
    {
        self.btnRemove.enabled = NO;
    }
}

@end

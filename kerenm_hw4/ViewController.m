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

    self.viewControllerList = [[TodoList alloc ]init];
    //[self.viewControllerList canAddItem:true];
    self.viewControllerList._allowDuplicates = YES;
    self.txtTodoItem.delegate = self;
    self.tblTodoList.delegate = self;
    self.tblTodoList.dataSource = self;
}

- (void)controlTextDidChange:(NSNotification *)notification {
    
//    BOOL itemExists = [self.viewControllerList hasItemWithTitle:self.txtTodoItem.stringValue];
//    //NSLog(itemExists ? @"Yes" : @"No");
//    self.btnRemove.enabled = itemExists;
//    
//    if([self.txtTodoItem.stringValue  isEqual: @""])
//    {
//        self.btnAdd.enabled = false;
//    }
//    else{
//        self.btnAdd.enabled = true;
//    }
    
    TodoItem *item = [TodoItem new];
    item.name = self.txtTodoItem.stringValue;
    [self.viewControllerList saveItem: item selectedRowIndex: self.rowIndex];
    [self.tblTodoList reloadData];
    
}

//- (void)tableView:(NSTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.rowIndex = indexPath;
//    NSLog(@"%@", self.rowIndex);
//}

- (void)tableViewSelectionIsChanging:(NSNotification *)aNotification{
    //NSLog(@"%ld", (long)self.tblTodoList.selectedRow);
    self.rowIndex = self.tblTodoList.selectedRow;
    self.txtTodoItem.stringValue = [self.viewControllerList getItemByIndex:(NSUInteger)self.rowIndex].name;
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
    self.viewControllerList._allowDuplicates = YES;
    TodoItem *item = [TodoItem new];
    item.name  = @"New Item";
    [self.viewControllerList addItem:item];
    [self.tblTodoList reloadData];
}

- (IBAction)btnRemove_Clicked:(id)sender {
    
}

@end

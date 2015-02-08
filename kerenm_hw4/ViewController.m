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
    self.txtTodoItem.delegate = self;
    self.tblTodoList.delegate = self;
    self.tblTodoList.dataSource = self;
}

- (void)controlTextDidChange:(NSNotification *)notification {
    
    BOOL itemExists = [self.viewControllerList hasItemWithTitle:self.txtTodoItem.stringValue];
    NSLog(itemExists ? @"Yes" : @"No");
    self.btnRemove.enabled = itemExists;
    
    if([self.txtTodoItem.stringValue  isEqual: @""])
    {
        self.btnAdd.enabled = false;
    }
    else{
        self.btnAdd.enabled = true;
    }
    
}

- (void)tableView:(NSTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.rowIndex = indexPath;
    NSLog(@"%@", self.rowIndex);
}

-(NSView*)tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)rowIndex
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"tableCellID" owner:nil];
    cell.textField.stringValue=@(rowIndex).stringValue;
    NSLog(@"rowindex %ld", (long)rowIndex);
    NSLog(@"rowindex %ld", (NSUInteger)rowIndex);
    cell.textField.stringValue =[self.viewControllerList getItemByIndex:(NSUInteger*)rowIndex].name;
    return cell;
}

-(NSInteger)   numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.viewControllerList itemCount];
}

- (IBAction)btnAdd_Click:(id)sender {
    TodoItem *item = [TodoItem new];
    item.name  = @"New Item";
    [self.viewControllerList addItem:item];
}

- (IBAction)btnRemove_Clicked:(id)sender {
    
}

@end

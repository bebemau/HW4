//
//  Document.m
//  kerenm_hw4
//
//  Created by Man, Keren on 2/5/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "Document.h"
#import "TodoList.h"
#import "ViewController.h"

@interface Document ()
//@property (nonatomic, readwrite)TodoList *documentTodoList;
@end

@implementation Document


- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        self.documentTodoList = [TodoList new];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    NSStoryboard *storyBoard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController  *windowController = [storyBoard instantiateControllerWithIdentifier:@"Document Window Controller"];
    [self addWindowController:windowController];
    
    ViewController *viewController = (ViewController*)windowController.contentViewController;
    
    viewController.viewControllerList  = self.documentTodoList;
    
    [viewController.tblTodoList reloadData];
    
    //[self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
}


//saving
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    
    //TodoList *list = [[TodoList alloc]initWithTitle:@"myTodolistkey"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.documentTodoList];
    return data;
    
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //return nil;
}

//load
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if([object isKindOfClass: [TodoList class]]){
        self.documentTodoList = object;
        return YES;
    }
    
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

@end

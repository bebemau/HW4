//
//  Document.h
//  kerenm_hw4
//
//  Created by Man, Keren on 2/5/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface Document : NSDocument
@property (nonatomic, readwrite) TodoList *documentTodoList;

@end


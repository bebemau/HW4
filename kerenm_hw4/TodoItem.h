//
//  TodoItem.h
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject <NSCoding>

@property (copy) NSString *name;
@property (copy) NSString *itemDetail;

@end

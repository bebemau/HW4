//
//  TodoItem.m
//  HW3
//
//  Created by Man, Keren on 2/1/15.
//  Copyright (c) 2015 Man, Keren. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

static NSString *const keyName = @"name";
static NSString *const keyDetail = @"detail";

//(instancetype)initWithNameDetail:(NSString*)name ItemDetail: (NSString*)detail
//{
//    //no need super init since init takes care of it
//    TodoItem *object = [[self alloc] init];
//    object.name = name;
//    object.detail  = detail;
//    return object;
//}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:keyName];
    [aCoder encodeObject:self.itemDetail forKey:keyDetail];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self)
    {
        self.name  = [aDecoder decodeObjectForKey:keyName];
        self.itemDetail  = [aDecoder decodeObjectForKey:keyDetail];
    }
    return self;
}

@end

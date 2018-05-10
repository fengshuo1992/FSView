//
//  NSObject+FSName.m
//  FSView
//
//  Created by gzlx on 2018/5/10.
//  Copyright © 2018年 gzlx. All rights reserved.
//

#import "NSObject+FSName.h"
#import <objc/runtime.h>

static NSString * key = @"name";

@implementation NSObject (FSName)

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, &key, name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name
{
   return objc_getAssociatedObject(self, &key);
}


@end

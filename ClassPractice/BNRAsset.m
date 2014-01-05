//
//  BNRAsset.m
//  ClassPractice
//
//  Created by jgilbert on 12/29/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description
{
    // Is holder non-nil?
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d>, assigned to %@",
                self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d>",
                self.label, self.resaleValue];
    }
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end

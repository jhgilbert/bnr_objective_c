//
//  BNRPerson.m
//  ClassPractice
//
//  Created by jgilbert on 12/28/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float)bodyMassIndex
{
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end

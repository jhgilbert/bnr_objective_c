//
//  BNRStockHolding.m
//  ClassChallenge
//
//  Created by jgilbert on 12/29/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)costInDollars
{
    float cost = [self purchaseSharePrice];
    int shares = [self numberOfShares];
    return cost * shares;
}

- (float)valueInDollars
{
    float value = [self currentSharePrice];
    int shares = [self numberOfShares];
    return value * shares;
}

@end

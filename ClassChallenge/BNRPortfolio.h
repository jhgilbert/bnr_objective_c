//
//  BNRPortfolio.h
//  ClassChallenge
//
//  Created by jgilbert on 1/4/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSObject
{
    float _totalValue;
}

@property (nonatomic, copy) NSArray *holdings;

- (NSArray *)holdings;
- (void)addStock:(BNRStockHolding *)stock;
- (NSArray *)topThree;
- (NSArray *)holdingsSymbols;
- (float)totalValue;

@end

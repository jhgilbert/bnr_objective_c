//
//  BNRStockHolding.h
//  ClassChallenge
//
//  Created by jgilbert on 12/29/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic) NSString *symbol;

- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOfShares

@end

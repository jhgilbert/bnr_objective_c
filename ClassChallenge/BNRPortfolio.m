//
//  BNRPortfolio.m
//  ClassChallenge
//
//  Created by jgilbert on 1/4/14.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio ()
{
    NSMutableArray *_holdings;
}
@end

@implementation BNRPortfolio
- (NSArray *)holdings
{
    if (!_holdings) {
        return [[NSArray alloc] init];
    } else {
        return [_holdings copy];
    }
}

- (void)addStock:(BNRStockHolding *)stock
{
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
        
    }
    [_holdings addObject:stock];
}

- (float)totalValue
{
    if (!_holdings) {
        return 0;
    } else {
        float sum = 0;
        for (BNRStockHolding *s in _holdings) {
            sum += [s valueInDollars];
        }
        return sum;
    }
}

@end

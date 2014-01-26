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

- (NSArray *)topThree
{    
    NSMutableArray *sortedHoldings = [_holdings mutableCopy];
    NSSortDescriptor *valueSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars"
                                                                          ascending: NO];
    [sortedHoldings sortUsingDescriptors:@[valueSortDescriptor]];
    if (sortedHoldings.count > 3) {
        return [sortedHoldings subarrayWithRange:NSMakeRange(0, 3)];
    } else {
        return sortedHoldings;
    }
}

- (NSArray *)holdingsSymbols
{
    NSMutableArray *holdingsSortedBySymbol = [_holdings mutableCopy];
    NSSortDescriptor *symbolSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"symbol"
                                                                           ascending: YES];
    [holdingsSortedBySymbol sortUsingDescriptors:@[symbolSortDescriptor]];
    NSMutableArray *symbols = [[NSMutableArray alloc] init];
    for (BNRStockHolding *h in holdingsSortedBySymbol) {
        [symbols addObject:h.symbol];
    }
    return [symbols copy];    
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

//
//  main.m
//  ClassChallenge
//
//  Created by jgilbert on 12/29/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        // Create three stock holdings and add them to the array
        BNRStockHolding *stock1 = [[BNRStockHolding alloc]init];
        stock1.purchaseSharePrice = 1.19;
        stock1.currentSharePrice = 3.40;
        stock1.numberOfShares = 100;
        [stocks addObject:stock1];
        
        BNRStockHolding *stock2 = [[BNRStockHolding alloc]init];
        stock2.purchaseSharePrice = 2.21;
        stock2.currentSharePrice = 1.47;
        stock2.numberOfShares = 50;
        [stocks addObject:stock2];
        
        BNRStockHolding *stock3 = [[BNRStockHolding alloc]init];
        stock3.purchaseSharePrice = 4.25;
        stock3.currentSharePrice = 6.40;
        stock3.numberOfShares = 200;
        [stocks addObject:stock3];
        
        BNRForeignStockHolding *stock4 = [[BNRForeignStockHolding alloc]init];
        stock4.purchaseSharePrice = 6.25;
        stock4.currentSharePrice = 11.40;
        stock4.numberOfShares = 700;
        stock4.conversionRate = 1.9;
        [stocks addObject:stock4];
        
        BNRForeignStockHolding *stock5 = [[BNRForeignStockHolding alloc]init];
        stock5.purchaseSharePrice = 3.25;
        stock5.currentSharePrice = 9.40;
        stock5.numberOfShares = 40;
        stock5.conversionRate = 3.4;
        [stocks addObject:stock5];
        
        // Loop through the array and print the value of each
        for(BNRStockHolding *s in stocks){
            NSLog(@"The stock's value is %f", [s valueInDollars]);
        }
        
        // Let's do a similar thing in a fancier way just for fun ...
        NSMutableArray *fancyStocks = [[NSMutableArray alloc] init];
        for(int i = 2; i < 5; i++){
            BNRStockHolding *tempStock = [[BNRStockHolding alloc]init];
            tempStock.purchaseSharePrice = i;
            tempStock.currentSharePrice = i + 1;
            tempStock.numberOfShares = i * 25;
            [fancyStocks addObject:tempStock];
        }
        
        for(BNRStockHolding *s in fancyStocks){
            NSLog(@"The stock's value is %f", [s valueInDollars]);
        }
        
        // For additional challenge appearing in Chapter 21
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];
        [portfolio addStock:stock2];
        [portfolio addStock:stock1];
        [portfolio addStock:stock3];
        [portfolio addStock:stock4];
        [portfolio addStock:stock5];
        NSLog(@"Total portfolio value is %f", [portfolio totalValue]);
        stock1.symbol = @"ARU";
        stock2.symbol = @"BLA";
        stock3.symbol = @"ZEE";
        stock4.symbol = @"CUP";
        stock5.symbol = @"HII";
        NSLog(@"%@", stock1.symbol);
        
        NSLog(@"All holdings: %@", portfolio.holdings);
                
        // Get three most valuable stocks
        NSArray *mostValuableStocks = [portfolio topThree];
        NSLog(@"Most valuable stocks:");
        for (BNRStockHolding *s in mostValuableStocks) {
            NSLog(@"%f", [s valueInDollars]);
        }
        
        // Print an alphabetized list of a portfolio's symbols
        NSLog(@"Alphabetized symbols of portfolio: %@", [portfolio holdingsSymbols]);
    }
    return 0;
}


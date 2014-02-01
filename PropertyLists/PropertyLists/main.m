//
//  main.m
//  PropertyLists
//
//  Created by jgilbert on 1/30/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //*********************************************
        //*
        //* Writing a property list to file
        //*
        //*********************************************
        
        // Create a portfolio container for all of our riches
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        // Create a stock
        NSMutableDictionary *stock;
        
        stock = [NSMutableDictionary dictionary];
        
        // Set its symbol
        [stock setObject:@"AAPL"
                  forKey:@"symbol"];
        // Set its number of shares
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        
        // Add it to our portfolio
        [stocks addObject:stock];
        
        // Make another stock following the same process
        stock = [NSMutableDictionary dictionary];
        
        [stock setObject:@"GOOG"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160]
                  forKey:@"shares"];
        [stocks addObject:stock];
        
        // Behold the magic of property lists!
        [stocks writeToFile:@"/tmp/stocks.plist"
                 atomically:YES];
        
        //*********************************************
        //*
        //* Reading a property list from file
        //*
        //*********************************************
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
        
    }
    return 0;
}


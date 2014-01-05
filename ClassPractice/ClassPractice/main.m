//
//  main.m
//  ClassPractice
//
//  Created by jgilbert on 12/28/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Create an array of BNREmployee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // Create a dictionary of executives
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i=0; i < 10; i++) {
            // Create an instance of BNREmployee
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            // Give the instance variables interesting values
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            // Put the employee in the employees array
            [employees addObject:mikey];
            
            // Is this the first employee?
            if (i == 0) {
                [executives setObject:mikey forKey:@"CEO"];
            }
            
            // Is this the second employee?
            if (i == 1) {
                [executives setObject:mikey forKey:@"CTO"];
            }
        }
        
        // Create 10 assets
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            // Create an asset
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            // Give the asset an interesting label
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            // Get a random number between 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            
            // Find that employee
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            // Assign the asset to the employee
            [randomEmployee addAsset:asset];
            [allAssets addObject:asset];
            
            if (i==2) {
                NSLog(@"%@", allAssets);
                NSLog(@"Removing the third asset ...");
                [allAssets removeObject:asset];
                NSLog(@"ALL ASSETS IS %@", allAssets);
            }
        }
        
        // Print out the entire executives dictionary
        NSLog(@"executives: %@", executives);
        
        // Print out the CEO's information
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat: @"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        
        toBeReclaimed = nil;
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"
                                                              ascending: YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID"
                                                              ascending:YES];
        [employees sortUsingDescriptors: @[voa, eid]];
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"Giving up ownership of arrays");
        
        allAssets = nil;
        employees = nil;
        
    }
    return 0;
}


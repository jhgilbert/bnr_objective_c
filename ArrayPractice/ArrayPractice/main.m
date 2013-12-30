//
//  main.m
//  ArrayPractice
//
//  Created by jgilbert on 12/27/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // create an array containing all three objects
        NSArray *dateList = @[now, tomorrow, yesterday];
        
        // Print a couple of dates
        NSLog(@"The first date is %@", dateList[0]);
        NSLog(@"The third date is %@", dateList[2]);
        NSLog(@"There are %lu dates", [dateList count]);
        
        // Iterate over the array
        NSUInteger dateCount = [dateList count];
        
        for (int i = 0; i < dateCount; i++) {
            NSDate *d = dateList[i];
            NSLog(@"Here is a date: %@", d);
        }
        
        NSString *string1 = @"Oh hi there";
        NSString *string2 = @"Hi hi hi hello";
        NSString *string3 = @"Greetings";
        
        NSArray *stringList = @[string1, string2, string3];
        
        NSUInteger stringCount = [stringList count];
        
        for (int i = 0; i < stringCount; i++){
            NSString *s = stringList[i];
            NSLog(@"%@", s);
        }
        
        // Use fast enumeration instead of a plain for loop
        for (NSString *s in stringList) {
            NSLog(@"Here is a string: %@", s);
        }
        
        // Use a mutable array instead
        NSString *num1 = @"four";
        NSString *num2 = @"six";
        NSString *num3 = @"seven";
        NSMutableArray *numList = [NSMutableArray array];
        [numList addObject:num1];
        [numList addObject:num2];
        [numList addObject:num3];
        
        for (NSString *s in numList) {
            NSLog(@"Here is a string: %@", s);
        }
        
        // challenge: make a grocery list and iterate through it. Similar to
        // what I already did above on my own time, but hey, practice makes perfect!
        NSMutableArray *groceries = [NSMutableArray array];
        
        NSString *item1 = @"Loaf of bread";
        NSString *item2 = @"Container of milk";
        NSString *item3 = @"Stick of butter";
        
        [groceries addObject:item1];
        [groceries addObject:item2];
        [groceries addObject:item3];
        
        for(NSString *i in groceries){
            NSLog(@"Grocery item: %@", i);
        }
        
    }
    return 0;
}


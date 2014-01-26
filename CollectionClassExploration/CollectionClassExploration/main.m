//
//  main.m
//  CollectionClassExploration
//
//  Created by jgilbert on 1/12/14.
//  The general challenge was to explore the NSArray, NSMutableArray, NSDictionary, and NSMutableDictionary class references.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // *************************
        // *
        // * NSArray
        // *
        // *************************
        
        
        // Create a basic array ... but what's the point of an empty array if it's immutable?
        NSArray *arr1 = [NSArray array];
        
        // At least we can copy it ...
        NSMutableArray *arr2 = [arr1 mutableCopy];
        
        // ... and then add objects ...
        [arr2 addObject:@1];
        [arr2 addObject:@2];
        [arr2 addObject:@3];
        
        // But let's get back to the NSArray.
        NSArray *arr3 = @[@1, @2, @3, @1];
        NSLog(@"arr3 is %@", arr3);
        
        // We can compare the two arrays
        BOOL comparisonResult = [arr1 isEqualToArray:arr3];
        NSLog(@"Array comparison result: %@", comparisonResult ? @"YES" : @"NO");
        
        // Can we get the index of an object in the array?
        NSUInteger indexOf2 = [arr3 indexOfObject:@2];
        NSLog(@"Index of 2 in arr3 is %lu", (unsigned long)indexOf2);
        
        // What if the item isn't in the array? We get a crazy high number.
        NSUInteger indexOf8 = [arr3 indexOfObject:@8];
        NSLog(@"Index of 8 in arr3 is %lu", (unsigned long)indexOf8);
        
        // A better way is probably containsObject:
        NSLog(@"The answer to whether arr3 contains @8: %d", [arr3 containsObject:@8]);
        NSLog(@"The answer to whether arr3 contains @2: %d", [arr3 containsObject:@2]);
        
        // But there are nicer ways to print bools ...
        BOOL result = [arr3 containsObject:@12];
        NSLog(@"The answer to whether arr3 contains @12: %@", result ? @"YES" : @"NO");
        
        // What if we want a range of objects?
        NSRange range = NSMakeRange(1, 3);
        
        NSArray *resultsArray = [arr3 subarrayWithRange:range];
        NSLog(@"The results array is %@", resultsArray);
        
        // *************************
        // *
        // * NSMutableArray
        // *
        // *************************
        
        // Set up initial array
        NSMutableArray *mut1 = [[NSMutableArray alloc] init];
        [mut1 addObject:@"Why"];
        [mut1 addObject:@"hello"];
        [mut1 addObject:@"there"];
        NSLog(@"mut1 is %@", mut1);
        
        // Make some additions and subtractions
        [mut1 insertObject:@8
                   atIndex:2];
        NSLog(@"mut1 is %@", mut1);
        NSUInteger anotherIndexOf8 = [mut1 indexOfObject:@8];
        [mut1 removeObjectAtIndex:anotherIndexOf8];
        NSLog(@"mut1 is %@", mut1);
        
        // We can remove more than one object at a time ...
        NSMutableArray *mut2 = [[NSMutableArray alloc] init];
        [mut2 addObjectsFromArray:@[@1, @2, @3, @2, @4, @5, @2, @9]];
        NSLog(@"mut2 is %@", mut2);
        [mut2 removeObjectIdenticalTo:@2];
        NSLog(@"mut2 is %@", mut2);
        
        // Replace object
        [mut2 exchangeObjectAtIndex:2
                  withObjectAtIndex:3];
        NSLog(@"mut2 is %@", mut2);

        // *************************
        // *
        // * NSDictionary
        // *
        // *************************
        
        // Create a dictionary
        NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys: @"cool", @"blue", @"warm", @"red", nil];
        NSLog(@"dict1 is %@", dict1);
        
        // Get the keys
        NSArray *dict1Keys = [dict1 allKeys];
        NSLog(@"dict1's keys are %@", dict1Keys);
        
        // Get a value associated with a key
        NSString *keyTest = @"blue";
        NSLog(@"The value for key 'blue' in dict 1 is '%@'", [dict1 valueForKey:keyTest]);
        
        // Loop through the dictionary and print each key, then value
        for (id key in dict1) {
            NSLog(@"The value for key %@ is: ", key);
            NSLog(@"%@", [dict1 valueForKey:key]);
        }
        
        // *************************
        // *
        // * NSMutableDictionary
        // *
        // *************************
        
        // Create a dictionary
        NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] init];
        
        // Add some keys/values
        [dict2 setValue:@"Mickey"
                 forKey:@"Minnie"];
        [dict2 setValue:@"Pluto"
                 forKey:@"Goofy"];
        
        NSLog(@"dict2 is %@", dict2);
        
        // Make a mutable copy from literal construction
        NSDictionary *dict3 = @{
            @"1": @"one",
            @"2": @"two",
            @"3": @"three",
            @"4": @"four"
        };
        NSMutableDictionary *dict3copy = [dict3 mutableCopy];
        NSLog(@"dict3copy is %@", dict3copy);
    }
    
    return 0;
}


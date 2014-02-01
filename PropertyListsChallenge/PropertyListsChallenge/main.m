//
//  main.m
//  PropertyListsChallenge
//
//  Created by jgilbert on 1/30/14.
//  The challenge is to create a property list that has all 8 types in it: array, dictionary, string, data, date, integer, float, and boolean.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *people = [[NSMutableArray alloc] init];
        
        // Create the variables we'll use to build a person
        NSMutableDictionary *person;
        NSURL *searchURL;
        NSData *searchMatches;
        NSDateComponents *birthdayComps;
        NSDate *birthday;
        NSNumber *numberOfSiblings;
        NSNumber *wealth;
        
        //***********************************************
        //*
        //* Build person 1
        //*
        //***********************************************

        
        person = [NSMutableDictionary dictionary];
        
        // Name her
        [person setObject:@"Jen"
                   forKey:@"name"];
        
        // Give her a birthday
        birthdayComps = [[NSDateComponents alloc] init];
        [birthdayComps setDay:2];
        [birthdayComps setMonth:5];
        [birthdayComps setYear:1980];
        
        birthday = [[NSCalendar currentCalendar] dateFromComponents:birthdayComps];
        
        [person setObject:birthday
                   forKey:@"birthday"];
        
        // Count her siblings
        numberOfSiblings = [NSNumber numberWithInt:1];
        [person setObject:numberOfSiblings
                   forKey:@"numberOfSiblings"];
        
        // Set her wealth
        wealth = [NSNumber numberWithFloat:12.52];
        
        [person setValue:wealth
                   forKey:@"wealth"];
        
        // Is she alive?        
        [person setObject:[NSNumber numberWithBool:YES]
                   forKey:@"isAlive"];
        
        // And get the Google matches for her name
        searchURL = [NSURL URLWithString:@"https://www.google.com/#q=Jen"];
        searchMatches = [NSData dataWithContentsOfURL:searchURL];
        
        // Save the Google matches
        [person setObject:searchMatches
                   forKey:@"searchMatches"];
        
        // Add her to the array of people
        [people addObject:person];
        
        
        //***********************************************
        //*
        //* Build person 2
        //*
        //***********************************************
        
        
        person = [NSMutableDictionary dictionary];
        
        // Name him
        [person setObject:@"Theodore"
                   forKey:@"name"];
        
        // Give him a birthday
        birthdayComps = [[NSDateComponents alloc] init];
        [birthdayComps setDay:14];
        [birthdayComps setMonth:2];
        [birthdayComps setYear:1782];
        
        birthday = [[NSCalendar currentCalendar] dateFromComponents:birthdayComps];
        
        [person setObject:birthday
                   forKey:@"birthday"];
        
        // Count his siblings
        numberOfSiblings = [NSNumber numberWithInt:9];
        [person setObject:numberOfSiblings
                   forKey:@"numberOfSiblings"];
        
        // Set his wealth
        wealth = [NSNumber numberWithFloat:140.18];
        
        [person setValue:wealth
                  forKey:@"wealth"];
        
        // Is he alive?
        [person setObject:[NSNumber numberWithBool:NO]
                  forKey:@"isAlive"];
        
        // And get the Google matches for his name
        searchURL = [NSURL URLWithString:@"https://www.google.com/#q=Theodore"];
        searchMatches = [NSData dataWithContentsOfURL:searchURL];
        
        // Save the Google matches
        [person setObject:searchMatches
                   forKey:@"searchMatches"];
        
        // Add him to the array of people
        [people addObject:person];
        
        
        //***********************************************
        //*
        //* Make a property list
        //*
        //***********************************************
        
        [people writeToFile:@"/tmp/people.plist"
                 atomically:YES];
        
    }
    return 0;
}


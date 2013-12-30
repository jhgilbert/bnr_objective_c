//
//  main.m
//  TimeAfterTime
//
//  Created by jgilbert on 12/27/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // get the host's name, because we can
        NSHost *host = [NSHost currentHost];
        NSString *name = [host localizedName];
        NSLog(@"The computer's name is %@", name);
        
        // play with time intervals
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        // fun with NSCalendar
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);
        
        unsigned long day = [cal ordinalityOfUnit:NSDayCalendarUnit
                                           inUnit:NSMonthCalendarUnit
                                          forDate:now];
        NSLog(@"This is day %lu of the month", day);
        
        // Challenge section: How many seconds since I was born?
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1980];
        [comps setMonth:5];
        [comps setDay:2];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        
        double secondsSinceBorn = [now timeIntervalSinceDate:dateOfBirth];
        
        NSLog(@"Jennifer Gilbert has been alive for %f seconds", secondsSinceBorn);
        
    }
    return 0;
}

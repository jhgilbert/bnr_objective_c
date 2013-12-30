//
//  main.m
//  TimesTwo
//
//  Created by jgilbert on 12/27/13.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is now %p", currentTime);
        NSLog(@"The address of the original object is %p, and the object it points to is %@", startTime, startTime);
        
        NSString *lament = @"Why me?";
        NSString *slogan = @"I \u2661 New York!";
        
        NSLog(@"%@ and %@", lament, slogan);
        
        NSDate *now = [[NSDate alloc] init];
        
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", now];
        NSLog(@"%@", dateString);
        
        // get the length of a string
        NSUInteger sloganLength = [slogan length];
        NSLog(@"%d", (int)sloganLength);
        
        // compare two strings
        NSString *string1 = @"hi";
        NSString *string2 = @"hi";
        if ([string1 isEqualToString:string2]) {
            NSLog(@"\"%@\" equals \"%@\"", string1, string2);
        }
        
        // capitalize a string
        NSLog(@"%@ capitalized is %@", string1, [string1 uppercaseString]);
        
        // challenge: test a string for matching substring, retrieve matching substring from buffer
        NSString *sub = @"blah";
        NSString *master = @"blahhhhrgh";
        
        NSRange matchRange = [master rangeOfString:sub
                                           options:NSCaseInsensitiveSearch];
        unichar matchBuffer[4];
        [master getCharacters:matchBuffer
                        range:matchRange];
        NSString *resultStr = [NSString stringWithCharacters:matchBuffer length:4];
        
        NSLog(@"%@", resultStr);
        
        // challenge: read a line and convert it to an NSString
        NSLog(@"Enter a word:");
        const char *userResponse = readline(NULL);
        NSString *finalString = [NSString stringWithUTF8String:userResponse];
        NSLog(@"%@", finalString);
        
        
    }
    return 0;
}


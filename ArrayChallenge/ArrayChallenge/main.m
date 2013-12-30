//
//  main.m
//  ArrayChallenge
//
//  Created by jgilbert on 12/28/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

// The challenge is to compare two arrays of words and capture which proper names have
// a lowercased counterpart in the common words list.

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Read in two files and convert them to arrays
        NSString *namesString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        NSString *wordsString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        NSArray *names = [namesString componentsSeparatedByString:@"\n"];
        NSArray *words = [wordsString componentsSeparatedByString:@"\n"];
        NSMutableArray *results = [[NSMutableArray alloc] init];
        
        // Loop through proper names and see whether any are common words as well
        double namesCount = [names count];
        for(int i = 0; i < namesCount; i++){
            NSString *lowercasedVersion = [names[i] lowercaseString];
            if ([words indexOfObject:lowercasedVersion] != NSNotFound){
                [results addObject:names[i]];
            }
        }
        NSLog(@"Results list is %ld items long:", [results count]);
        for (NSString *s in results){
            NSLog(@"%@", s);
        }
    }
    return 0;
}


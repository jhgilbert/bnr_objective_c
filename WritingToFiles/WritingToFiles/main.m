//
//  main.m
//  WritingToFiles
//
//  Created by jgilbert on 12/31/13.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        
        // add a few lines of code to our mutable string
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Jen is cool!\n"];
        }
        
        [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:NULL];
        NSLog(@"done writing /tmp/cool.txt");
        
    }
    return 0;
}


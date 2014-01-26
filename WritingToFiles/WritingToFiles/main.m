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
        
        //********************************************
        //
        // WRITING TO FILES
        //
        //********************************************
        
        // add a few lines of code to our mutable string
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Jen is cool!\n"];
        }
        
        // Declare a pointer to an NSError object, but do not instantiate it.
        // The NSError instance will only be created if there is an error.
        
        NSError *error;
        
        // Pass the NSError pointer by reference to the NSString method
        BOOL success = [str writeToFile:@"/too/darned/bad.txt" // giving a bad path on purpose
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];
        
        // Test the returned BOOL, and query the NSError if the write failed
        if (success) {
            NSLog(@"done writing");
        } else {
            NSLog(@"writing failed: %@", [error localizedDescription]);
        }
        
        //********************************************
        //
        // READING FROM FILES
        //
        //********************************************
        
        NSError *readError;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                         encoding:NSASCIIStringEncoding
                                                            error:&readError];
        if (!str2) {
            NSLog(@"read failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"resolv.conf looks like this: %@", str2);
        }
        
        //********************************************
        //
        // Writing NSData objects to files
        //
        //********************************************
        
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *requestError = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&requestError];
        
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic
                                   error:&requestError];
        
        if (!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        //********************************************
        //
        // Reading NSData from the file we just created
        //
        //********************************************
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
        
    }
    return 0;
}


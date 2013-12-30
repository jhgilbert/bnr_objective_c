//
//  main.c
//  StructChallenge
//
//  Created by jgilbert on 12/25/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    // The challenge: Write a program that will tell me what the date (4-30-2015 format is fine) will be in 4 million seconds.
    
    long nowInt = time(NULL);
    long laterInt = nowInt + 4000000;
    struct tm laterStruct;
    localtime_r(&laterInt, &laterStruct);
    printf("4 million seconds from now, the date will be %d-%d-%d", (laterStruct.tm_mon + 1), laterStruct.tm_mday, (laterStruct.tm_year + 1900));
    return 0;
}


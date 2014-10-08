//
//  ViewController.m
//  URLLoader
//
//  Created by Arif Fikri Bin Ahmad Abas on 10/8/14.
//  Copyright (c) 2014 TeratoTech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *responseData;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.umplife.com/login"]
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!theConnection)
    {
        NSLog(@"Connection Failed...");
    }
}

#pragma NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse
{
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *url = [NSString stringWithFormat:@"%@", connection.currentRequest.URL];
    NSLog(@"URL = %@",  url);
    NSString *dataInString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", dataInString);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Just in case if there is any error
    NSLog(@"Error");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

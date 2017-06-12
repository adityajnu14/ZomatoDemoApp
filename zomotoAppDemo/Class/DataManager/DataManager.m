//
//  dataManager.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 24/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DataManager.h"
#import "Define.h"
#import "AppDelegate.h"

@implementation DataManager
{
    NSMutableArray* _dataList;
}

+(instancetype)sharedManager
{
    static DataManager* sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DataManager alloc]init];
    });
    
    return sharedManager;
}

- (void)fetchZomatoDataFor:(NSString*)city cuisin:(NSString*)cuisines filter:(NSString*)filter handler:(void (^)(NSMutableArray*))completion
{
    
    
    city = [city stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    cuisines = [cuisines stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL* urlString = [NSURL URLWithString:[kZomatoURL stringByAppendingString:
                                             [NSString stringWithFormat:@"entity_type=city&q=%@&cuisines=%@", city, cuisines]]];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:urlString];
    request.HTTPMethod=@"GET";
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:kAPI_KEY forHTTPHeaderField:@"user_key"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

        if (error != nil)
        {
            NSLog(@"Error in web service call: %@",error);
            return;
        }

       NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:nil];
    NSMutableArray* restaurent = [jsonData objectForKey:@"restaurants"];
    _dataList = [[NSMutableArray alloc]init];
    for(NSDictionary* aDict in restaurent)
    {
         if([filter isEqualToString:@"budget"])
         {
             if([[aDict valueForKeyPath:@"restaurant.price_range"] intValue] < 3)
                 [_dataList addObject:[aDict objectForKey:@"restaurant"]];
         }
        else if(filter.length == 0)
        {
            [_dataList addObject:[aDict objectForKey:@"restaurant"]];
        }
        
    }
        completion(_dataList);
    }];
    
    [dataTask resume];
   
}

@end

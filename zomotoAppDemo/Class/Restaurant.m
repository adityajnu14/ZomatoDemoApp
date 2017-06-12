//
//  Restaurant.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

- (instancetype) initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if(self)
    {
        self.restaurentName = [dict objectForKey:@"name"];
        self.restaurentCuisines = [dict objectForKey:@"cuisines"];
        self.restaurentImageURL = [dict objectForKey:@"featured_image"];
        self.userRating = [[[dict objectForKey:@"user_rating"] objectForKey:@"aggregate_rating"] floatValue];
    }
    return  self;
}

@end

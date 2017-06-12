//
//  Restaurant.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (strong, nonatomic) NSString* restaurentName;
@property (strong, nonatomic) NSString* restaurentCuisines;
@property (strong, nonatomic) NSString* restaurentImageURL;

@property (atomic, assign) float userRating;

- (instancetype) initWithDictionary:(NSDictionary*)dict;

@end

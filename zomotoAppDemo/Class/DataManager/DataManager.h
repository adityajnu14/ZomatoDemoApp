//
//  dataManager.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 24/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

- (void)fetchZomatoDataFor:(NSString*)city cuisin:(NSString*)cuisines filter:(NSString*)filter handler:(void (^)(NSMutableArray*))completion;

+ (instancetype)sharedManager;

@end

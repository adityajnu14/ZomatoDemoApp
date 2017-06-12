//
//  ImageManager.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageManager : NSObject


- (void) getImageByURLString:(NSString*)imageURL completionBlock:(void (^)(BOOL succeeded, UIImage* imagefile))handler;
@end

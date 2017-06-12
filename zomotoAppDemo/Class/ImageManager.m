//
//  ImageManager.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "AppDelegate.h"
#import "ImageManager.h"

@implementation ImageManager


- (void) getImageByURLString:(NSString*)imageURL completionBlock:(void (^)(BOOL succeeded, UIImage* imagefile))handler
{
    NSString* imageName = [imageURL lastPathComponent];
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [paths objectAtIndex:0];
    NSString* imagePath = [documentDirectory stringByAppendingString:imageName];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:imagePath])
    {
        handler(YES, [UIImage imageWithContentsOfFile:imagePath]);
    }
    else
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imageURL]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(YES, [UIImage imageWithData:data]);
                [data writeToFile:imagePath atomically:YES];
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            });
        });
    }
}


@end

//
//  zomatoCollectionViewCell.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 24/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "ZomatoCollectionViewCell.h"
#import "ImageManager.h"

@implementation ZomatoCollectionViewCell


-(void)setDataToCell:(Restaurant*)restaurent
{
    self.restNameLabel.text = restaurent.restaurentName;
    self.cuisinesLabel.text = restaurent.restaurentCuisines;
    self.userRatingLabel.layer.cornerRadius = 2.0;
    self.restImageView.layer.cornerRadius = 5.0;
    self.userRatingLabel.text = [NSString stringWithFormat:@"%.1f", restaurent.userRating];
    NSString* URL =restaurent.restaurentImageURL;
    
    ImageManager* imageManager = [[ImageManager alloc]init];
    [imageManager getImageByURLString:URL completionBlock:^(BOOL succeeded, UIImage *imagefile) {
        if(succeeded)
        self.restImageView.image = imagefile;
    }];
}

@end

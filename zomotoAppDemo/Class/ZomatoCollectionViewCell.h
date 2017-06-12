//
//  zomatoCollectionViewCell.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 24/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface ZomatoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView* restImageView;

@property (weak, nonatomic) IBOutlet UILabel* restNameLabel;
@property (weak, nonatomic) IBOutlet UILabel* cuisinesLabel;
@property (atomic, assign) IBOutlet UILabel* userRatingLabel;

-(void)setDataToCell:(Restaurant*)restaurent;

@end

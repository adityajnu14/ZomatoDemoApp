//
//  BookRestaurentViewController.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
@interface BookRestaurentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *restaurentImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurentName;
@property (weak, nonatomic) IBOutlet UILabel *restauentCousines;

- (void) setDatatoVC:(Restaurant*)restaurentData;
@end

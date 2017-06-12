//
//  BookRestaurentViewController.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 27/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ImageManager.h"
#import "BookRestaurentViewController.h"

@interface BookRestaurentViewController ()
{
    Restaurant* _restaurentDataForBooking;
}
@end

@implementation BookRestaurentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if(_restaurentDataForBooking.restaurentName.length)
    self.restaurentName.text = _restaurentDataForBooking.restaurentName;
    if(_restaurentDataForBooking.restaurentCuisines.length)
    self.restauentCousines.text = _restaurentDataForBooking.restaurentCuisines;
    if(_restaurentDataForBooking.restaurentImageURL.length)
    {
        ImageManager* imageManager = [[ImageManager alloc]init];
        [imageManager getImageByURLString:_restaurentDataForBooking.restaurentImageURL completionBlock:^(BOOL succeeded, UIImage *imagefile)
        {
            if(succeeded)
                self.restaurentImage.image = imagefile;
        }];
    
    }

}

- (void) setDatatoVC:(Restaurant*)restaurentData
{
    _restaurentDataForBooking = restaurentData;
}


@end

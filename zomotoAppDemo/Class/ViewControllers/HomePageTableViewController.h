//
//  HomePageTableViewController.h
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 01/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UICollectionView* youMightLikeCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView* restaurentColletionView;

@property (weak, nonatomic) IBOutlet UIButton *orderOnlineButton;
@property (weak, nonatomic) IBOutlet UIButton *bookATableButton;
@property (weak, nonatomic) IBOutlet UIButton *browseNearByButton;

@end

//
//  HomePageTableViewController.m
//  zomotoAppDemo
//
//  Created by Aditya Kumar on 01/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "Restaurant.h"
#import "DataManager.h"
#import "ZomatoCollectionViewCell.h"
#import "BookRestaurentViewController.h"
#import "HomePageTableViewController.h"

@interface HomePageTableViewController ()
{
    NSMutableArray* _budgetRestaurntData;
    NSMutableArray* _allRestaurentData;
}
@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customiseNavigationBar];
    [self fetchDataforbudgerRestaurent];
    [self fetchAllRestaurentData];
    self.youMightLikeCollectionView.tag = 1;
    self.restaurentColletionView.tag = 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    [self setButtonAppearances];
}

- (void) setButtonAppearances
{
    [self.orderOnlineButton setBackgroundColor:[UIColor whiteColor]];
    [self.orderOnlineButton.layer setCornerRadius:5.0];
    [self.bookATableButton setBackgroundColor:[UIColor whiteColor]];
    [self.bookATableButton.layer setCornerRadius:5.0];
    [self.browseNearByButton setBackgroundColor:[UIColor whiteColor]];
    [self.browseNearByButton.layer setCornerRadius:5.0];
}

- (void) customiseNavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.788 green:0.137 blue:0.192 alpha:1.0];
}

- (void) fetchDataforbudgerRestaurent
{
    DataManager* dataManager = [DataManager sharedManager];
    __weak typeof(self) weakSelf = self;
  
    [dataManager fetchZomatoDataFor:@"Mumbai" cuisin:@"North" filter:@"budget" handler:^(NSMutableArray *data) {
        _budgetRestaurntData =data;
        if(_budgetRestaurntData.count > 0)
            [weakSelf.youMightLikeCollectionView reloadData];
    }];
}

- (void) fetchAllRestaurentData
{
    DataManager* dataManager = [DataManager sharedManager];
    __weak typeof(self) weakSelf = self;
    
    [dataManager fetchZomatoDataFor:@"Mumbai" cuisin:@"North" filter:@"" handler:^(NSMutableArray *data) {
        _allRestaurentData =data;
        if(_allRestaurentData.count > 0)
            [weakSelf.youMightLikeCollectionView reloadData];
    }];
}

#pragma - mark uicollectionview cell

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(_budgetRestaurntData.count == 0 || _allRestaurentData.count == 0)
        return 10;
    if(collectionView.tag == 0)
        return [_budgetRestaurntData count];
    else
        return [_allRestaurentData count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const reuseIdentifier = @"Cell";
    ZomatoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if(_budgetRestaurntData.count == 0 || _allRestaurentData.count == 0)
        return cell;
    if(collectionView.tag == 0)
    {
        Restaurant* aRestaurent = [[Restaurant alloc]initWithDictionary:[_budgetRestaurntData objectAtIndex:indexPath.row]];
        [cell setDataToCell:aRestaurent];
    }
    else
    {
        Restaurant* aRestaurent = [[Restaurant alloc]initWithDictionary:[_allRestaurentData objectAtIndex:indexPath.row]];

        [cell setDataToCell:aRestaurent];
    }
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"restaurentDetails" sender:collectionView];
    return YES;
}

#pragma - mark segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender NS_AVAILABLE_IOS(5_0)
{
    
    if([segue.identifier isEqualToString:@"restaurentDetails"])
    {
        UICollectionView* collectionViewInstance = (UICollectionView*)sender;
        NSIndexPath* index = [[collectionViewInstance indexPathsForSelectedItems] lastObject];
        NSMutableDictionary* aDict = [NSMutableDictionary dictionary];
        if(collectionViewInstance.tag == 1)
            [aDict addEntriesFromDictionary:[_budgetRestaurntData objectAtIndex:index.row]];
        else
            [aDict addEntriesFromDictionary:[_budgetRestaurntData objectAtIndex:index.row]];

        Restaurant* aRestData = [[Restaurant alloc]initWithDictionary:aDict];
        
        BookRestaurentViewController* BRVC = segue.destinationViewController;
        [BRVC setDatatoVC:aRestData];
        
    }
}


@end

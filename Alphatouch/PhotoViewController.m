//
//  PhotoViewController.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/12/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"
#import "UIImageView+AFNetworking.h"
#import "UserModel.h"
#import "Photo.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //Create image paramters for the Cell to take
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [imageView setImageWithURL:[NSURL URLWithString:self.photo.filename]];
    imageView.frame = CGRectMake(10,10,300,300);
    
    [self.view addSubview:imageView];
    
    UILabel *imageTitleLabel = [[UILabel alloc] init];
    imageTitleLabel.text = self.photo.title;
    imageTitleLabel.frame = CGRectMake(10, 320, 300, 40);
    [self.view addSubview:imageTitleLabel];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.user = [UserModel getUser];

    
    BOOL photoAlreadyInteresting = NO;
    
    for(Photo *p in self.user.favoritePhotos)
        if ([p.title isEqualToString:self.photo.title]) {
            photoAlreadyInteresting = YES;
        }

if(!photoAlreadyInteresting) {
    UIButton *favoriteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    favoriteButton.frame = CGRectMake(90, 321, 200, 39);
    [favoriteButton setTitle:@"Make Favorite" forState:UIControlStateNormal];
    [self.view addSubview:favoriteButton];
    [favoriteButton addTarget:self action:@selector(makeThisPhotoAFavorite:) forControlEvents:UIControlEventTouchUpInside];}
else {
    // don't show the button because this Place is already interesting.
}

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.photo = [[ Photo alloc]initWithTitle:@"Whitebeard" detail:@"fdfdz" filename:@"white.jpg" thmbnail:@"non"];
        self.photo.filename = @"white.jpg";
        self.photo.title = @"Whitebeard";
    }
    return self;
    
        
    
}
-(void) makeThisPhotoAFavorite:(id)sender
{
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:self.user.favoritePhotos];
    [tempArray addObject:self.photo];
    
    self.user.favoritePhotos = [[NSArray alloc]initWithArray:tempArray];
    
    [UserModel saveUser:self.user];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Photo Favorited!" message:@"This Photo is now one of your favorite photos!" delegate:nil cancelButtonTitle:@"Hooray!" otherButtonTitles: nil];
    
    [alert show];
    
    [self.tabBarController.tabBar.items[1] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)self.user.favoritePhotos.count] ];
    
    [sender removeFromSuperview];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

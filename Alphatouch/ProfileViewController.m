//
//  ProfileViewController.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/10/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "UserModel.h"
#import "Photo.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(320,580);

    
    UILabel *twitterName = [[UILabel alloc]initWithFrame:CGRectMake(20, 500, 280, 40)];
    twitterName.text = @"@Yazeed";
    [self.scrollView addSubview:twitterName];
    
    [self.view addSubview:self.scrollView];
    
    self.user = [[UserModel alloc]init];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(requestSuccessful) name:@"initWithJSONFinishedLoading" object:nil];
    
    //Location
    UILabel *locationN = [[UILabel alloc] initWithFrame:CGRectMake(20,470,280,40)];
    locationN.text = [NSString stringWithFormat:@"Location: %@", self.user.location];
    [self.scrollView addSubview:locationN];

    
}
-(void) requestSuccessful
{
    
    //Image
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    
    UIImage *placeholder = [UIImage imageNamed:@"placeholder.jpg"];
    
    NSURL *imageURL = [NSURL URLWithString:self.user.profilePhoto.filename];
    
    [profileImageView setImageWithURL:imageURL placeholderImage:placeholder];
    profileImageView.image = placeholder;
    
    UIButton *customGoku = [UIButton buttonWithType:UIButtonTypeCustom];
//    [customGoku setImage:[UIImage imageNamed:@"dbz.jpg"] forState:UIControlStateNormal];
    
//    [customGoku setImage:[UIImage imageNamed:@"dbz.jpg"] forState:UIControlStateHighlighted];
    
    customGoku.frame = CGRectMake(20,20,100,114);
    [customGoku addTarget:self action:@selector(createbutton:) forControlEvents:UIControlEventTouchUpInside];
     [self.scrollView addSubview:customGoku];

    
    [self.scrollView addSubview:profileImageView];
    
    //NAME
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20,140,280,40);
    nameLabel.text = [NSString stringWithFormat:@"Name: %@ %@", self.user.firstName, self.user.lastName];
    [self.scrollView addSubview:nameLabel];
    
    //City
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,200,280,40)];
    cityLabel.text = [NSString stringWithFormat:@"City: %@", self.user.city];
    [self.scrollView addSubview:cityLabel];
    
    // Biography
    UITextView *biography = [[UITextView alloc] initWithFrame:CGRectMake(12,260,300,180)];
    biography.font = [UIFont fontWithName:@"Helvetica" size:15];
    biography.editable = NO;
    biography.text = [NSString stringWithFormat:@"Bio: %@", self.user.biography];
    [self.scrollView addSubview:biography];
    
    //member since
    UILabel *memberSinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,440,280,40)];
    memberSinceLabel.text = [NSString stringWithFormat:@"Member Since: %@", self.user.memberSince];
    [self.scrollView addSubview:memberSinceLabel];
    
    
   
    
    // Button
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editLocation)];
    self.navigationItem.rightBarButtonItem = button;
    
    
    
}
-(void)editLocation
{
    ProfileEditViewController *profileVC = [[ProfileEditViewController alloc]init];
    profileVC.user = self.user;
    [self.navigationController presentViewController:profileVC animated:YES completion:nil];
    
}


-(void) createbutton:(id)sender
{
    UIViewController *gokuIS = [[UIViewController alloc]init];
    gokuIS.view.frame = self.view.frame;
    gokuIS.title = @"The Great One";
    
    NSURL *fe = [[NSURL alloc]initWithString:@"http://static.comicvine.com/uploads/scale_small/3/39241/790730-konachan.com___41666_dragonball_son_goku.png"];
    
    UIImageView *theRealGoku = [[UIImageView alloc] init];
    [theRealGoku setImageWithURL:fe placeholderImage:[UIImage imageNamed:@"dbz.jpg"]];
    
    theRealGoku.frame = gokuIS.view.frame;
    [theRealGoku setContentMode:UIViewContentModeScaleAspectFit];
    [gokuIS.view addSubview:theRealGoku];
    [self.navigationController pushViewController:gokuIS animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"Diamond-Sword-icon"];
    }
    return self;
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

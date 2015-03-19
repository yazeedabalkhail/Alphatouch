//
//  ProfileViewController.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/10/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "ProfileEditViewController.h"

@interface ProfileViewController : UIViewController 

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSDictionary *userProfile;
@property (strong, nonatomic) UserModel *user;


-(void) createbutton:(id) sender;
-(void) requestSuccessful;
-(void) editLocation;
@end

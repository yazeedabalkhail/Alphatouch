//
//  ProfileEditViewController.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/17/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface ProfileEditViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) UserModel *user;
@property (strong, nonatomic) UITextField *locationField;

-(void) saveLocation;
-(void) enetringFore;
-(void) saveUserWhenClosing;


@end

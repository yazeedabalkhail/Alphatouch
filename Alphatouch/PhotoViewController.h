//
//  PhotoViewController.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/12/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;
@class UserModel;
@interface PhotoViewController : UIViewController


@property (strong,nonatomic) Photo *photo;
@property (strong,nonatomic) UserModel *user;

-(void) makeThisPhotoAFavorite:(id)sender;

@end

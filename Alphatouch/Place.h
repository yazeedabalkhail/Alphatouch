//
//  Place.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *description;

-(id)initWithName:(NSString*) aName description: (NSString*)aDescription;


@end

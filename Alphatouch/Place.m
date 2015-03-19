//
//  Place.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "Place.h"

@implementation Place

-(id) initWithName:(NSString *)aName description:(NSString *)aDescription
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.description = aDescription;
    }
    return self;
}
-(id)init
{
    self = [self initWithName:@"defaultName" description:@"defaultDescription"];
    return self;
}

@end

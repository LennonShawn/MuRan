//
//  IndexAdsInfo.m
//  
//
//  Created by lisz on 9/24/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import "IndexAdsInfo.h"

@implementation IndexAdsInfo

- (void)dealloc
{
    RELEASE_SAFELY(_cartoonID);
    RELEASE_SAFELY(_fileName);
    RELEASE_SAFELY(_fileURL);
    RELEASE_SAFELY(_appLink);
    [super dealloc];
}

@end

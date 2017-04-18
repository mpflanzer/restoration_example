//
//  DataController.m
//  RestorationExample
//
//  Created by Moritz Pflanzer on 18/04/2017.
//  Copyright © 2017 Moritz Pflanzer. All rights reserved.
//

#import "DataController.h"

@implementation DataController

- (instancetype)init
{
    NSLog(@"DataController::init");

    self = [super init];
    if (self) {
        self.dataOffset = 0;
    }
    return self;
}

@end

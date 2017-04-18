//
//  MainWindowController.m
//  RestorationExample
//
//  Created by Moritz Pflanzer on 18/04/2017.
//  Copyright © 2017 Moritz Pflanzer. All rights reserved.
//

#import "Document.h"

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    NSLog(@"MainWindowController::windowDidLoad");

    [super windowDidLoad];

    [((Document*)self.document).dataController addObserver:self forKeyPath:@"dataOffset" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}

- (void)windowWillClose:(NSNotification *)notification
{
    [((Document*)self.document).dataController removeObserver:self forKeyPath:@"dataOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"dataOffset"])
    {
        NSLog(@"Change data offset: %u", [change[NSKeyValueChangeNewKey] intValue]);
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end

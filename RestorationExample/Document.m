//
//  Document.m
//  RestorationExample
//
//  Created by Moritz Pflanzer on 18/04/2017.
//  Copyright © 2017 Moritz Pflanzer. All rights reserved.
//

#import "Document.h"

#import "MainWindowController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    NSLog(@"Document::init");

    self = [super init];

    if (self) {
        self.dataController = [[DataController alloc] init];
    }

    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    [self addWindowController:[[MainWindowController alloc] initWithWindowNibName:@"MainWindow"]];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    NSLog(@"Document::readFromData");
    return YES;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"Document::encode");

    [super encodeRestorableStateWithCoder:coder];

    [self.dataController encodeRestorableStateWithCoder:coder];
}

- (void)restoreStateWithCoder:(NSCoder *)coder
{
    NSLog(@"Document::restore");

    [super restoreStateWithCoder:coder];

    [self.dataController restoreStateWithCoder:coder];
}

@end

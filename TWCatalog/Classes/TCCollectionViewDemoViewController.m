//
//  TCCollectionViewDemoViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 6/11/10.
//  Copyright 2010 Tasteful Works. All rights reserved.
//

#import "TCCollectionViewDemoViewController.h"
#import <TWToolkit/TWToolkit.h>

@implementation TCCollectionViewDemoViewController

#pragma mark Class Methods

+ (NSString *)title {
	return @"Collection View";
}

#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
    self.view.backgroundColor = [UIColor whiteColor];
    
    collectionView = [[TWCollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
}

@end

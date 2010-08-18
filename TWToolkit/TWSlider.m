//
//  TWSlider.m
//  TWToolkit
//
//  Created by Sam Soffes on 8/18/10.
//  Copyright 2010 Tasteful Works, Inc. All rights reserved.
//

#import "TWSlider.h"

@implementation TWSlider

@synthesize numberOfTickMarks = _numberOfTickMarks;
//@synthesize tickMarkPosition = _tickMarkPosition;
@synthesize allowsTickMarkValuesOnly = _allowsTickMarkValuesOnly;

#pragma mark UIView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.numberOfTickMarks = 0;
		self.allowsTickMarkValuesOnly = NO;
	}
	return self;
}

@end

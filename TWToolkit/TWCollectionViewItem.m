//
//  TWCollectionViewItem.m
//  TWToolkit
//
//  Created by Sam Soffes on 6/11/10.
//  Copyright 2010 Tasteful Works. All rights reserved.
//

#import "TWCollectionViewItem.h"

@implementation TWCollectionViewItem

@synthesize imageView = _imageView;
@synthesize textLabel = _textLabel;
@synthesize detailTextLabel = _detailTextLabel;
@synthesize backgroundView = _backgroundView;
@synthesize selectedBackgroundView = _selectedBackgroundView;
@synthesize reuseIdentifier = _reuseIdentifier;
@synthesize selectionStyle = _selectionStyle;
@synthesize selected = _selected;
@synthesize highlighted = _highlighted;

#pragma mark NSObject

- (void)dealloc {
	[_imageView release];
	[_textLabel release];
	[_detailTextLabel release];
	[_backgroundView release];
	[_selectedBackgroundView release];
	[_reuseIdentifier release];
	[super dealloc];
}

#pragma mark UIView

- (id)initWithFrame:(CGRect)frame {
    return [self initWithStyle:TWCollectionViewItemStyleDefault reuseIdentifier:nil];
}

#pragma mark TWCollectionViewItem

- (id)initWithStyle:(TWCollectionViewItemStyle)style reuseIdentifier:(NSString *)aReuseIdentifier {
	if ((self = [super initWithFrame:CGRectZero])) {
		_style = style;
		_reuseIdentifier = [aReuseIdentifier copy];
    }
    return self;
}


- (void)prepareForReuse {
	
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	
}

@end

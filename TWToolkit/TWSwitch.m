//
//  TWSwitch.m
//  TWToolkit
//
//  Created by Sam Soffes on 8/10/10.
//  Copyright 2010 Tasteful Works, Inc. All rights reserved.
//

#import "TWSwitch.h"
#import "UIImage+TWToolkitAdditions.h"

static CGFloat kTWSwitchHeight = 27.0;

@interface TWSwitch (PrivateMethods)
- (void)_layoutSubviewsWithHandlePosition:(CGFloat)x;
- (void)_handleReleased:(id)sender;
- (void)_handleDragged:(id)sender event:(UIEvent *)event;
- (void)_handleDraggingEnded:(id)sender;
@end


@implementation TWSwitch

@synthesize on = _on;
@synthesize handle = _handle;
@synthesize onLabel = _onLabel;
@synthesize offLabel = _offLabel;
@synthesize onBackgroundImageView = _onBackgroundImageView;
@synthesize offBackgroundImageView = _offBackgroundImageView;
@synthesize handleWidth = _handleWidth;
@synthesize handleShadowWidth = _handleShadowWidth;

#pragma mark NSObject

- (void)dealloc {
	self.handle = nil;
	self.onLabel = nil;
	self.offLabel = nil;
	self.onBackgroundImageView = nil;
	self.offBackgroundImageView = nil;
	[super dealloc];
}


#pragma mark UIView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, kTWSwitchHeight)])) {
		self.backgroundColor = [UIColor clearColor];
		self.clipsToBounds = YES;
		self.autoresizesSubviews = NO;
		
		// On background
		_onBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, kTWSwitchHeight)];
		_onBackgroundImageView.image = [[UIImage imageNamed:@"images/UISwitchTrackBlue.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
		[self addSubview:_onBackgroundImageView];
		
		// On label
		_onLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_onLabel.backgroundColor = [UIColor clearColor];
		_onLabel.font = [UIFont boldSystemFontOfSize:16.0];
		_onLabel.text = @"ON";
		_onLabel.textAlignment = UITextAlignmentCenter;
		_onLabel.textColor = [UIColor whiteColor];
		_onLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
		[_onBackgroundImageView addSubview:_onLabel];
		
		// Off background
		_offBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		_offBackgroundImageView.image = [[UIImage imageNamed:@"images/UISwitchTrackClear.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
		[self addSubview:_offBackgroundImageView];
		
		// Off label
		_offLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_offLabel.backgroundColor = [UIColor clearColor];
		_offLabel.font = [UIFont boldSystemFontOfSize:16.0];
		_offLabel.text = @"OFF";
		_offLabel.textAlignment = UITextAlignmentCenter;
		_offLabel.textColor = [UIColor colorWithWhite:0.498 alpha:1.0];
		[_offBackgroundImageView addSubview:_offLabel];
		
		// Button
		_handle = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[_handle addTarget:self action:@selector(_handleReleased:) forControlEvents:UIControlEventTouchUpInside];
		[_handle addTarget:self action:@selector(_handleDragged:event:) forControlEvents:UIControlEventTouchDragInside];
		[_handle addTarget:self action:@selector(_handleDraggingEnded:) forControlEvents:UIControlEventTouchUpOutside];
		[self addSubview:_handle];
		
		// Private defaults
		_dragging = NO;
		_hitCount = 0;
		_handleWidth = 41.0;
		_handleShadowWidth = 2.0;
		self.on = NO;
	}
	return self;
}


#pragma mark Switch

- (void)setOn:(BOOL)on {
	[self setOn:on animated:NO];
}


- (void)setOn:(BOOL)on animated:(BOOL)animated {
	_on = on;
	// TODO: UIControl stuff
	
	if (animated) {
		[UIView beginAnimations:[NSString stringWithFormat:@"TWSwitchAnimate%@", (_on ? @"On" : @"Off")] context:nil];
		[UIView setAnimationDuration:0.15];
	}
	
	[self _layoutSubviewsWithHandlePosition:(_on ? self.frame.size.width - _handleWidth : 0.0)];
	
	if (animated) {
		[UIView commitAnimations];
	}
}


- (void)toggle {
	[self toggleAnimated:YES];
}


- (void)toggleAnimated:(BOOL)animated {
	[self setOn:!_on animated:animated];
}


#pragma mark Private Methods

- (void)_layoutSubviewsWithHandlePosition:(CGFloat)x {
	CGFloat width = self.frame.size.width;
	CGFloat sideWidth = width - _handleWidth;
	CGFloat totalHandleWidth = _handleWidth + _handleShadowWidth + _handleShadowWidth;
	
	// Enforce limits
	x = fmin(fmax(0.0, x), sideWidth);
	
	// TODO: Abstract to method
	if (x <= 0.0) {
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonRightShadowed.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateNormal];
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonRightShadowedDown.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateHighlighted];
	} else if (x >= sideWidth) {
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonLeftShadowed.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateNormal];
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonLeftShadowedDown.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateHighlighted];
	} else {
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonFullShadowed.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateNormal];
		[_handle setBackgroundImage:[[UIImage imageNamed:@"images/UISwitchButtonFullShadowedDown.png" bundle:@"TWToolkit.bundle"] stretchableImageWithLeftCapWidth:8 topCapHeight:0] forState:UIControlStateHighlighted];
	}
	
	_handle.frame = CGRectMake(x - _handleShadowWidth, 0.0, totalHandleWidth, kTWSwitchHeight);
	_onBackgroundImageView.frame = CGRectMake(0.0, 0.0, width, kTWSwitchHeight);
	_offBackgroundImageView.frame = CGRectMake(x, 0.0, width - x, kTWSwitchHeight);
//	_onLabel.frame = CGRectMake(0 .0, 0.0, sideWidth, kTWSwitchHeight);
//	_offLabel.frame = CGRectMake(width + _handleWidth, 0.0, sideWidth, kTWSwitchHeight);
}


- (void)_handleReleased:(id)sender {
	// Tapped
	if (_dragging == NO) {
		_hitCount++;
		[self toggle];
		return;
	}
	
	// Drag release
	_dragging = NO;
	if (_on) {
		[self setOn:(_handle.frame.origin.x >= self.frame.size.width - _handleWidth - _handleShadowWidth) animated:YES];
	} else {
		[self setOn:(_handle.frame.origin.x > -_handleShadowWidth) animated:YES];
	}
}


- (void)_handleDragged:(id)sender event:(UIEvent *)event {
	UITouch *touch = [[event touchesForView:_handle] anyObject];
	
	if (_dragging == NO) {
		_dragOffset = [touch locationInView:_handle].x;
	}
	
	_dragging = YES;
	[self _layoutSubviewsWithHandlePosition:[touch locationInView:self].x - _dragOffset];
}


- (void)_handleDraggingEnded:(id)sender {
	_dragging = NO;
	[self _handleReleased:sender];
}

@end

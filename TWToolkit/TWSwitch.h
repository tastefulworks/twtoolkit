//
//  TWSwitch.h
//  TWToolkit
//
//  Created by Sam Soffes on 8/10/10.
//  Copyright 2010 Tasteful Works, Inc. All rights reserved.
//

@interface TWSwitch : UIControl {
	
	UIButton *_handle;
	UILabel *_onLabel;
	UILabel *_offLabel;
	UIImageView *_onBackgroundImageView;
	UIImageView *_offBackgroundImageView;
	CGFloat _handleWidth;
	CGFloat _handleShadowWidth;
	
	BOOL _on;
	BOOL _dragging;
	CGFloat _dragOffset;
	NSInteger _hitCount;
}

@property (nonatomic, assign, getter=isOn) BOOL on;
@property (nonatomic, retain) UIButton *handle;
@property (nonatomic, copy) UILabel *onLabel;
@property (nonatomic, copy) UILabel *offLabel;
@property (nonatomic, retain) UIImageView *onBackgroundImageView;
@property (nonatomic, retain) UIImageView *offBackgroundImageView;
@property (nonatomic, assign) CGFloat handleWidth;
@property (nonatomic, assign) CGFloat handleShadowWidth;

- (void)setOn:(BOOL)on animated:(BOOL)animated;
- (void)toggle;
- (void)toggleAnimated:(BOOL)animated;

@end

//
//  TWSlider.h
//  TWToolkit
//
//  Created by Sam Soffes on 8/18/10.
//  Copyright 2010 Tasteful Works, Inc. All rights reserved.
//

//typedef enum {
//	TWSliderTickMarkBelow = 0,
//	TWSliderTickMarkAbove = 1,
//	TWSliderTickMarkLeft  = TWSliderTickMarkAbove,
//	TWSliderTickMarkRight = TWSliderTickMarkBelow
//} TWSliderTickMarkPosition;


@interface TWSlider : UISlider {
	
	NSInteger _numberOfTickMarks;
//	TWSliderTickMarkPosition _tickMarkPosition;
	BOOL _allowsTickMarkValuesOnly;
}

@property (nonatomic, assign) NSInteger numberOfTickMarks;
@property (nonatomic, assign) BOOL allowsTickMarkValuesOnly;

//
// Currently drawing of tick marks is not supported. Here is
// the planned API adapted from NSSlider.
//
// @property (nonatomic, assign) TWSliderTickMarkPosition tickMarkPosition;
//
// - (CGFloat)tickMarkValueAtIndex:(NSInteger)index;
// - (CGRect)rectOfTickMarkAtIndex:(NSInteger)index;
// - (NSInteger)indexOfTickMarkAtPoint:(CGPoint)point;
// - (CGFloat)closestTickMarkValueToValue:(CGFloat)value;
//

@end

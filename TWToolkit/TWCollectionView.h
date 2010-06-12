//
//  TWCollectionView.h
//  TWToolkit
//
//  Created by Sam Soffes on 6/11/10.
//  Copyright 2010 Tasteful Works. All rights reserved.
//

#import "TWCollectionViewItem.h"

//typedef enum {
//    TWCollectionViewScrollPositionNone = UITableViewScrollPositionNone,
//    TWCollectionViewScrollPositionTop = UITableViewScrollPositionTop,
//    TWCollectionViewScrollPositionTop = UITableViewScrollPositionTop,
//    TWCollectionViewScrollPositionTop = UITableViewScrollPositionTop
//} TWCollectionViewScrollPosition;
//
//typedef enum {
//    TWCollectionViewRowAnimationFade = UITableViewRowAnimationFade,
//    TWCollectionViewRowAnimationRight = UITableViewRowAnimationRight,
//    TWCollectionViewRowAnimationLeft = UITableViewRowAnimationLeft,
//    TWCollectionViewRowAnimationTop = UITableViewRowAnimationTop,
//    TWCollectionViewRowAnimationBottom = UITableViewRowAnimationBottom,
//    TWCollectionViewRowAnimationNone = UITableViewRowAnimationNone,
//    TWCollectionViewRowAnimationMiddle = UITableViewRowAnimationMiddle,
//} TWCollectionViewRowAnimation;

@protocol TWCollectionViewDelegate;
@protocol TWCollectionViewDataSource;

@interface TWCollectionView : UIScrollView {

	id <TWCollectionViewDataSource>  _dataSource;
	
	CGFloat _rowHeight;
	CGFloat _rowSpacing;
	
	UIView *_backgroundView;
	UIView *_collectionHeaderView;
	UIView *_collectionFooterView;

	NSUInteger _minNumberOfRows;
	NSUInteger _minNumberOfColumns;
	NSUInteger _maxNumberOfRows;
	NSUInteger _maxNumberOfColumns;
	
	CGSize _minItemSize;
	CGSize _maxItemSize;
	
//	NSUInteger _selectedSection;
//	NSUInteger _selectedItem;
//	NSUInteger _lastSelectedSection;
//	NSUInteger _lastSelectedItem;
}

@property (nonatomic, assign) id<TWCollectionViewDataSource> dataSource;
@property (nonatomic, assign) id<TWCollectionViewDelegate> delegate;

@property (nonatomic) CGFloat rowHeight;
@property (nonatomic) CGFloat rowSpacing;

@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) UIView *collectionHeaderView;
@property (nonatomic, retain) UIView *collectionFooterView;

@property (nonatomic) NSUInteger minNumberOfRows;
@property (nonatomic) NSUInteger minNumberOfColumns;
@property (nonatomic) NSUInteger maxNumberOfRows;
@property (nonatomic) NSUInteger maxNumberOfColumns;

@property (nonatomic) CGSize minItemSize;
@property (nonatomic) CGSize maxItemSize;

//@property (nonatomic, getter=isEditing) BOOL editing;
@property (nonatomic) BOOL allowsSelection;
//@property (nonatomic) BOOL allowsSelectionDuringEditing;

- (void)reloadData;
//
//- (NSInteger)numberOfSections;
//- (NSInteger)numberOfItemsInSection:(NSInteger)section;
//
//- (CGRect)rectForSection:(NSInteger)section;
//- (CGRect)rectForHeaderInSection:(NSInteger)section;
//- (CGRect)rectForFooterInSection:(NSInteger)section;
//- (CGRect)rectForItemAtIndex:(NSUInteger)index;
//
//- (NSUInteger)indexForItemAtPoint:(CGPoint)point;
//- (NSUInteger)indexForItem:(TWCollectionViewItem *)item;
//- (NSArray *)indexsForItemsInRect:(CGRect)rect;
//
//- (TWCollectionViewItem *)itemAtIndex:(NSUInteger)index;
//- (NSArray *)visibleItems;
//- (NSArray *)indexsForVisibleItems;
//
//- (void)scrollToItemAtIndexPath:(NSUInteger)index atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
//- (void)scrollToNearestSelectedItemAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
//
//- (void)insertSections:(NSIndexSet *)sections withItemAnimation:(UITableViewItemAnimation)animation;
//- (void)deleteSections:(NSIndexSet *)sections withItemAnimation:(UITableViewItemAnimation)animation;
//- (void)reloadSections:(NSIndexSet *)sections withItemAnimation:(UITableViewItemAnimation)animation;
//
//- (void)insertItemsAtIndexPaths:(NSArray *)indexs withItemAnimation:(UITableViewItemAnimation)animation;
//- (void)deleteItemsAtIndexPaths:(NSArray *)indexs withItemAnimation:(UITableViewItemAnimation)animation;
//- (void)reloadItemsAtIndexPaths:(NSArray *)indexs withItemAnimation:(UITableViewItemAnimation)animation
//
//- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
//
//- (NSUInteger)indexForSelectedItem;
//
//- (void)selectItemAtIndexPath:(NSUInteger)index animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
//- (void)deselectItemAtIndexPath:(NSUInteger)index animated:(BOOL)animated;

@end


@protocol TWCollectionViewDelItemegate <NSObject, UIScrollViewDelegate>

@optional

- (void)collectionView:(TWCollectionView *)aCollectionView willDisplayItem:(TWCollectionViewItem *)cell forIndex:(NSUInteger)index;

- (NSUInteger)aCollectionView:(TWCollectionView *)aCollectionView willSelectItemAtIndex:(NSUInteger)index;
- (NSUInteger)aCollectionView:(TWCollectionView *)aCollectionView willDeselectItemAtIndex:(NSUInteger)index;

- (void)collectionView:(TWCollectionView *)aCollectionView didSelectItemAtIndex:(NSUInteger)index;
- (void)collectionView:(TWCollectionView *)aCollectionView didDeselectItemAtIndex:(NSUInteger)index;

//- (UITableViewItemEditingStyle)tableView:(UITableView *)tableView editingStyleForItemAtIndex:(NSUInteger)index;
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForItemAtIndex:(NSUInteger)index;
//- (void)tableView:(UITableView*)tableView willBeginEditingItemAtIndex:(NSUInteger)index;
//- (void)tableView:(UITableView*)tableView didEndEditingItemAtIndex:(NSUInteger)index;
//
//- (NSUInteger)aCollectionView:(TWCollectionView *)aCollectionView targetIndexPathForMoveFromItemAtIndexPath:(NSUInteger)sourceIndexPath toProposedIndexPath:(NSUInteger)proposedDestinationIndexPath;               

@end


@protocol TWCollectionViewDataSource <NSObject>

@required

- (NSInteger)numberOfItemsInCollectionView:(TWCollectionView *)aCollectionView;
- (TWCollectionViewItem *)aCollectionView:(TWCollectionView *)aCollectionView itemForIndex:(NSUInteger)index;

@optional

//- (BOOL)collectionView:(TWCollectionView *)aCollectionView canEditItemAtIndex:(NSUInteger)index;
//- (BOOL)collectionView:(TWCollectionView *)aCollectionView canMoveItemAtIndex:(NSUInteger)index;
//
//- (void)collectionView:(TWCollectionView *)aCollectionView commitEditingStyle:(TWCollectionViewItemEditingStyle)editingStyle forItemAtIndex:(NSUInteger)index;
//
//- (void)collectionView:(TWCollectionView *)aCollectionView moveItemAtIndexPath:(NSUInteger)sourceIndexPath toIndexPath:(NSUInteger)destinationIndexPath;

@end

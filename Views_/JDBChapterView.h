//
//  JDBChapterView.h
//  FlashCardProject
//
//  Created by Jon Blount on 6/18/12.
// This represents the view for the chapter selection screen
//

#import <UIKit/UIKit.h>

@interface JDBChapterView : UITableViewController 
<UITableViewDelegate, UITableViewDataSource>

//@property(strong, nonatomic) NSArray *listData;
@property(strong, nonatomic) NSDictionary *chapters;
@property(strong, nonatomic) NSArray *selectedChapter;
@property(strong, nonatomic) NSMutableArray *indexKeeper;
@property(strong, nonatomic) NSArray *keys;

@end

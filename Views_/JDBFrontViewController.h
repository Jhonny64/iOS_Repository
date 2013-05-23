//
//  JDBFrontViewController.h
//  FlashCardProject
//
//  Created by Jon Blount on 6/18/12.
//  These are outlets used for the front view of the card. 
//

#import <UIKit/UIKit.h>

@interface JDBFrontViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *frontWord;
@property (strong, nonatomic) NSDictionary * words;
@property (weak, nonatomic) NSString *frontWordContents;
@property (strong, nonatomic) NSArray *currentWordList;
@property (weak, nonatomic) IBOutlet UIButton *flipButton;
@property (weak, nonatomic) NSNumber *theIndexNumber;

//horizontal swipe detected action
-(IBAction)swipeRightDetected:(id)sender;
-(IBAction)swipeLeftDetected:(id)sender;



@end

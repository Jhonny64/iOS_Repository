//
//  JDBBackViewController.h
//  FlashCardProject
//
//  Created by Jon Blount on 6/18/12.
//  Outlets used for representing the back view of a flashcard. 
//

#import <UIKit/UIKit.h>

@interface JDBBackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ReadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *TranslationLabel;
@property (weak, nonatomic) NSString *ReadingWord;
@property (weak, nonatomic) NSString *TranslationWord;

@end

//
//  JDBEditViewController.h
//  FlashCardProject
//
//  Created by Jon Blount on 6/20/12.
//  This is the implementation of the field that allows the user to add cards to their deck
//

#import <UIKit/UIKit.h>

@interface JDBEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *frontInput;
@property (weak, nonatomic) IBOutlet UITextField *explanationInput;
@property (weak, nonatomic) IBOutlet UITextField *subInput;

@property (weak, nonatomic) NSString *theFront;
@property (weak, nonatomic) NSString *theBack;
@property (weak, nonatomic) NSString *theExp;

@property (weak, nonatomic) NSMutableArray *currentArray;

-(IBAction)addPressed:(id)sender;
-(IBAction)doneEditing:(id)sender;

@end

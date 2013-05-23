//
//  JDBBackViewController.m
//  FlashCardProject
//
//  Created by Jon blount on 6/18/12.
//  This is the model class for the back view of the flash card. 
//

#import "JDBBackViewController.h"

@interface JDBBackViewController ()

@end

@implementation JDBBackViewController
@synthesize ReadingLabel;
@synthesize TranslationLabel;
@synthesize ReadingWord, TranslationWord;

-(void)viewWillDisappear:(BOOL)animated{

    [UIView beginAnimations:@"animation2" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration: 0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO]; 
    [UIView commitAnimations];  
}

-(void)viewWillAppear:(BOOL)animated{
    
    [UIView beginAnimations:@"animation2" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration: 0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO]; 
    [UIView commitAnimations];  
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    ReadingLabel.text = ReadingWord;
    TranslationLabel.text = TranslationWord;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setReadingLabel:nil];
    [self setTranslationLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

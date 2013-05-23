//
//  JDBFrontViewController.m
//  FlashCardProject
//
//  Created by Jon Blount on 6/18/12.
//  The model for the front view of the flash card. 
//

#import "JDBFrontViewController.h"
#import "JDBBackViewController.h"


@interface JDBFrontViewController ()

@end

@implementation JDBFrontViewController

@synthesize frontWord;
@synthesize words;
@synthesize frontWordContents;
@synthesize currentWordList;
@synthesize flipButton;
@synthesize theIndexNumber;


int theIndex;

-(IBAction)swipeRightDetected:(id)sender{
// add implementation
    //frontWord.text = [currentWordList objectAtIndex:1];
    if ((NSUInteger)theIndex < [currentWordList count] -1
        ){
        theIndex = theIndex + 1;
    }
    else {
        theIndex = 0;
    }
    
    NSDictionary * thisDic = [currentWordList objectAtIndex:theIndex];
    NSLog(@"%@", currentWordList);
    frontWord.text = [thisDic objectForKey:@"FrontWord"];
    NSLog(@"%@", [thisDic objectForKey:@"FrontWord"]);
    
}


-(IBAction)swipeLeftDetected:(id)sender{
    // add implementation
    //frontWord.text = [currentWordList objectAtIndex:1];
    if ((NSUInteger)theIndex > 0
        ){
        theIndex = theIndex - 1;
    }
    else {
        theIndex = ([currentWordList count] -1);
    }
    
    NSDictionary * thisDic = [currentWordList objectAtIndex:theIndex];
    NSLog(@"%@", currentWordList);
    frontWord.text = [thisDic objectForKey:@"FrontWord"];
    NSLog(@"%@", [thisDic objectForKey:@"FrontWord"]);
    
    
}


/*
-(void)viewWillAppear:(BOOL)animated{
    
    
    frontWord.text = frontWordContents;
    [super viewWillAppear:animated];
    
}
*/
 
 
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
    [super viewDidLoad];
    //frontWord.text = @"Something.";
    frontWord.text = frontWordContents;

    
    
    theIndex = 0;//CHANGE THIS LATER to "theIndexNumber"
    //self.navigationItem.hidesBackButton = TRUE;
    
    UISwipeGestureRecognizer *swipeRight= [[UISwipeGestureRecognizer alloc] 
                                         initWithTarget:self
                                           action:@selector(swipeRightDetected:)];
    
    swipeRight.numberOfTouchesRequired = 1;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft= [[UISwipeGestureRecognizer alloc] 
                                           initWithTarget:self
                                           action:@selector(swipeLeftDetected:)];
    
    swipeLeft.numberOfTouchesRequired = 1;
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
  
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.frontWord = nil;
    self.words = nil;
    self.frontWordContents = nil;
    self.currentWordList = nil;
    [self setFlipButton:nil];
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"BackSegue"]){
        
        JDBBackViewController *childController = [JDBBackViewController alloc];
        childController = segue.destinationViewController;
        NSDictionary * thisDic = [currentWordList objectAtIndex:theIndex];
        NSLog(@"CURRENT CURRENT WORD LIST%@", currentWordList);
        NSString * rWord = [thisDic objectForKey:@"Reading"];
        NSString * tWord = [thisDic objectForKey:@"Translation"];
        [childController setReadingWord:rWord];
        
        [childController setTranslationWord:tWord];
        NSLog(@"%@", childController.ReadingWord);
        NSLog(@"%@", childController.TranslationWord);
        [childController viewDidLoad];
        
    }
    
}


@end

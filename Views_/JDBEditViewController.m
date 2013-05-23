//
//  JDBEditViewController.m
//  FlashCardProject
//
//  Created by Jon Blount on 6/20/12.
//  This is the model for the editor view. 
//

#import "JDBEditViewController.h"

@interface JDBEditViewController ()

@end

@implementation JDBEditViewController
@synthesize frontInput, explanationInput, subInput;
@synthesize theFront, theBack, theExp;
@synthesize currentArray;


-(IBAction)addPressed:(id)sender{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Books.plist"];
 
    self.theFront = frontInput.text;
    self.theBack = explanationInput.text;
    self.theExp = subInput.text;
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];

    [data setObject:theFront forKey:@"FrontWord"];
    [data setObject:theBack forKey:@"Reading"];
    [data setObject:theExp forKey:@"Translation"];
    
    [currentArray addObject:data];


    [data writeToFile:plistPath atomically:YES];

    
   
    
}

-(IBAction)doneEditing:(id)sender{
    
    [sender resignFirstResponder];
    
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
    [super viewDidLoad];
    
    /*//Fix this code later, it is intended to read/ write into plist data
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Books.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]){
        
        plistPath = [[NSBundle mainBundle]pathForResource:@"Books" ofType:@"plist"];        
    }
    
    // read property list into memory as an NSData object
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    // convert static property list into dictionary object
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if (!temp)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
     */
    
    //assign values
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

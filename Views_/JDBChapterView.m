//
//  JDBChapterView.m
//  FlashCardProject
//
//  Created by Jon Blount on 6/18/12.
//  This is the view for the chapter selection screen.
//

#import "JDBChapterView.h"
#import "JDBAppDelegate.h"
#import "JDBFrontViewController.h"
#import "JDBEditViewController.h"

@interface JDBChapterView ()

@property (strong, nonatomic) JDBFrontViewController *childController;
@property (strong, nonatomic) JDBEditViewController *editChildController;

@end

@implementation JDBChapterView
//@synthesize listData;
@synthesize chapters;
@synthesize selectedChapter;
@synthesize childController;
@synthesize indexKeeper;
@synthesize keys;
@synthesize editChildController;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    indexKeeper = [NSMutableArray alloc];
    //initialize arrays for displaying table data. 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Books"ofType:@"plist"];
    NSDictionary *allChapters = [[NSDictionary alloc]initWithContentsOfFile:path];
    //self.chapters = [allChapters objectForKey:@"BookI"];
    self.chapters = allChapters;
    NSArray *array = [[chapters allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.keys  = array;
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.selectedChapter = nil;
    self.chapters= nil;
    //self.keys = nil;
    //self.childController = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //tableView.backgroundColor = [UIColor clearColor];
    return [self.chapters count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"chapterCell";
        NSUInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:row];
        
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...;
    //NSString *a = [chapters objectAtIndex:indexPath.row];
    
    //NSDictionary *chapters = [self.chapters objectAtIndex:indexPath.row];
    //NSString *cellLabelMessage = [[NSString alloc] initWithFormat:@"Chapter %i",[indexPath row] + 1];
    
    cell.textLabel.text = key;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    //NSString * keyString = [[NSString alloc] initWithFormat:@"Chapter %i",[indexPath row] + 1];
    NSString *keyString = [keys objectAtIndex:row];
   // NSLog(@"%@", keyString);
    
    NSArray *chapterr = [[NSArray alloc] initWithArray:[self.chapters valueForKey:keyString]];
    self.selectedChapter = chapterr;
    //NSLog(@"This Selected Chapter: %@", selectedChapter);
   //NSLog(@"%@", self.selectedChapter);
   // NSLog(@"\n");
    
    
    
    [self performSegueWithIdentifier:@"FrontSegue" sender:self]; //This causes a double push error. 
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"FrontSegue"]){
        childController = segue.destinationViewController;
        
        
        NSDictionary * thisDic = [selectedChapter objectAtIndex:0];
        //NSLog(@"%@", selectedChapter);
        NSString * fWord = [thisDic objectForKey:@"FrontWord"];
        [childController setFrontWordContents:fWord];
        [childController setCurrentWordList:selectedChapter];
        //if (indexKeeper objectAt
        //[childController setTheIndexNumber:[indexKeeper objectAtIndex:0]];
        //NSLog(@"%@", childController.frontWordContents);
        //NSLog(@"%@", childController.frontWord.text);
        NSLog(@"THE CURRENT ARRAY: %@", selectedChapter);
        [childController viewDidLoad];
    
    }
    
if ([segue.identifier isEqualToString:@"EditSegue"]){
    
    editChildController = segue.destinationViewController;
   //[editChildController setCurrentArray:userArray];
    //NSLog(@"THE CURRENT ARRAY: %@", editChildController.currentArray);
    
    }
    
}
 


@end

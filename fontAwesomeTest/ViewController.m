//
//  ViewController.m
//  fontAwesomeTest
//
//  Created by Chris Chares on 3/26/14.
//  Copyright (c) 2014 Eunoia Design Co. All rights reserved.
//

#import "ViewController.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#import <CoreText/CoreText.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@property NSDictionary *allFonts;
@property NSArray *allFontKeys;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allFonts = [FAKFontAwesome allIcons];
    _allFontKeys = [_allFonts allKeys];
    /* Button text
    CGFloat size = 20;
    FAKFontAwesome *starIcon = [FAKFontAwesome femaleIconWithSize:size];
    NSMutableAttributedString *fullText = [[NSMutableAttributedString alloc] initWithAttributedString:starIcon.attributedString];
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:@" one star" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size] }];
    [fullText appendAttributedString:text];
    [self.button setAttributedTitle:fullText forState:UIControlStateNormal];
    [self.button sizeToFit];
     */
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allFonts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    CGFloat size = 16;
    NSString *iconString = _allFontKeys[indexPath.row];
    NSString *iconDescription = [NSString stringWithFormat:@" %@",_allFonts[iconString]];
    
    FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:iconString size:size];
    NSMutableAttributedString *fullText = [[NSMutableAttributedString alloc] initWithAttributedString:icon.attributedString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    
    
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:iconDescription attributes:@{
                                                                                                       NSFontAttributeName : [UIFont systemFontOfSize:size] }];
    [fullText appendAttributedString:text];
    [cell.textLabel setAttributedText:fullText];

    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

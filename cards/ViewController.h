//
//  ViewController.h
//  cards
//
//  Copyright (c) 2018 Farzan Faghihi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameplayKit/GameplayKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *restartLabel;
@property (strong, nonatomic) UIImage *base;
@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSArray *buttons;
@property(nonatomic, assign) float difficulty;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *first;
@property (weak, nonatomic) IBOutlet UIButton *second;
@property (weak, nonatomic) IBOutlet UIButton *third;
@property (weak, nonatomic) IBOutlet UIButton *forth;
@property (weak, nonatomic) IBOutlet UIButton *fifth;
@property (weak, nonatomic) IBOutlet UIButton *sixth;
@property (weak, nonatomic) IBOutlet UIButton *seventh;
@property (weak, nonatomic) IBOutlet UIButton *eighth;
@property (weak, nonatomic) IBOutlet UIButton *nineth;
@property (weak, nonatomic) IBOutlet UIButton *tenth;
@property (weak, nonatomic) IBOutlet UIButton *eleventh;
@property (weak, nonatomic) IBOutlet UIButton *twelvth;
@property (weak, nonatomic) IBOutlet UIButton *hardButton;
@property (weak, nonatomic) IBOutlet UIButton *mediumButton;
@property (weak, nonatomic) IBOutlet UIButton *easyButton;
- (void)restart_game;
- (void)win_game:(int)button_num;
@end


//
//  ViewController.m
//  cards
//
//  Copyright (c) 2018 Farzan Faghihi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clicked:(id)sender {
    int button_num = 0;
    if (sender == self.first) {
        [sender setImage:_images[0] forState:UIControlStateNormal];
    }
    else if (sender == self.second) {
        button_num = 1;
        [sender setImage:_images[1] forState:UIControlStateNormal];
    }
    else if (sender == self.third) {
        button_num = 2;
        [sender setImage:_images[2] forState:UIControlStateNormal];
    }
    else if (sender == self.forth) {
        button_num = 3;
        [sender setImage:_images[3] forState:UIControlStateNormal];
    }
    else if (sender == self.fifth) {
        button_num = 4;
        [sender setImage:_images[4] forState:UIControlStateNormal];
    }
    else if (sender == self.sixth) {
        button_num = 5;
        [sender setImage:_images[5] forState:UIControlStateNormal];
    }
    else if (sender == self.seventh) {
        button_num = 6;
        [sender setImage:_images[6] forState:UIControlStateNormal];
    }
    else if (sender == self.eighth) {
        button_num = 7;
        [sender setImage:_images[7] forState:UIControlStateNormal];
    }
    else if (sender == self.nineth) {
        button_num = 8;
        [sender setImage:_images[8] forState:UIControlStateNormal];
    }
    else if (sender == self.tenth) {
        button_num = 9;
        [sender setImage:_images[9] forState:UIControlStateNormal];
    }
    else if (sender == self.eleventh) {
        button_num = 10;
        [sender setImage:_images[10] forState:UIControlStateNormal];
    }
    else {
        button_num = 11;
        [sender setImage:_images[11] forState:UIControlStateNormal];
    }
    [self win_game:button_num];
}

// checks if player won the game; also checks if two cards are the same
- (void)win_game:(int)button_num {
    bool did_win = true;
    for (int i = 0 ; i < 12 ; ++i) {
        if (!([[_buttons[i] currentImage] isEqual:self.base]) && [_buttons[i] isEnabled]) {
            if (button_num != i && ([[_buttons[i] currentImage] isEqual:[_buttons[button_num] currentImage]])) {
                [self.buttons[i] setEnabled:false];
                [self.buttons[button_num] setEnabled:false];
            }
            else if (button_num != i ) {
                double delayInSeconds = self.difficulty;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    
                    [UIView transitionWithView:self.buttons[button_num]
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionFlipFromLeft
                                    animations: ^{[self.buttons[button_num] setImage:self.base forState:UIControlStateNormal];}
                                    completion:nil];
                    
                });
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    
                    [UIView transitionWithView:self.buttons[i]
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionFlipFromRight
                                    animations: ^{ [self.buttons[i] setImage:self.base forState:UIControlStateNormal];}
                                    completion:nil];
                    
                });
                
            }
        }
        if ([self.buttons[i] isEnabled]) did_win = false;
    }
    if (did_win) self.winLabel.hidden = false;
}

- (IBAction)restartDidTouched:(id)sender {
    [self restart_game];
    self.restartLabel.hidden = true;
}

// restarts the game and randomly puts pictures in different buttons
- (void)restart_game {
    id button_objs[] = {_first, _second, _third, _forth, _fifth, _sixth, _seventh, _eighth, _nineth, _tenth, _eleventh, _twelvth};
    NSUInteger button_count = sizeof(button_objs) / sizeof(id);
    self.buttons = [NSArray arrayWithObjects:button_objs count:button_count];
    UIImage *img1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *img4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *img5 = [UIImage imageNamed:@"5.jpg"];
    UIImage *img6 = [UIImage imageNamed:@"6.jpg"];
    id objs[] = {img1, img1, img2, img2, img3, img3, img4, img4, img5, img5, img6, img6};
    self.base = [UIImage imageNamed:@"base.jpg"];
    NSUInteger count = sizeof(objs) / sizeof(id);
    self.images = [NSArray arrayWithObjects:objs count:count];
    self.images = [self.images shuffledArray];
    for (int i = 0; i < 12; ++i) {
        [_buttons[i] setImage:self.images[i] forState:UIControlStateSelected];
        [_buttons[i] setImage:self.base forState:UIControlStateNormal];
        [_buttons[i] setEnabled:true];
        [_buttons[i] setHidden:true];
    }
    self.winLabel.hidden = true;
    self.easyButton.hidden = false;
    self.mediumButton.hidden = false;
    self.hardButton.hidden = false;
}

- (IBAction)difficultyButtonDidTouched:(id)sender {
    if (sender == self.easyButton) {
        self.difficulty = 1;
    }
    else if (sender == self.mediumButton) {
        self.difficulty = 0.6;
    }
    else {
        self.difficulty = 0.08;
    }
    self.easyButton.hidden = true;
    self.mediumButton.hidden = true;
    self.hardButton.hidden = true;
    self.restartLabel.hidden = false;
    for (int i = 0 ; i < 12 ; ++i) {
        [_buttons[i] setHidden:false];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self restart_game];
    self.restartLabel.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.h
//  Pre-K
//
//  Created by Nathan Burgess on 4/16/14.
//  Copyright (c) 2014 Nathan Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>



@interface ViewController : UIViewController <AVAudioPlayerDelegate>


{
	   
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    
    
    
    __weak IBOutlet UIImageView *mainImage;
    
    __weak IBOutlet UIImageView *tempDrawImage;
    
    IBOutlet UIButton *stars;
    
    
    
    AVAudioPlayer *theAudio;
    // Audio for buttons
    
}


- (IBAction)colorChosen:(id)sender;

- (IBAction)eraseCanvas:(id)sender;

- (IBAction) navigationButton;

- (IBAction) homeButton;




@end











//
//  H-ViewController.m
//  Pre-K
//
//  Created by Nathan Burgess on 5/9/14.
//  Copyright (c) 2014 Nathan Burgess. All rights reserved.
//

#import "H-ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>


@interface H_ViewController ()

@end

@implementation H_ViewController

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
    // Do any additional setup after loading the view.
}


// Play the Arrow Button Sound

- (IBAction) navigationButton {
    
    NSString *path = nil;
    
    path = [[NSBundle mainBundle] pathForResource:@"navigation_button" ofType:@"mp3"];
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [theAudio prepareToPlay];
    theAudio.delegate = self;
    [theAudio play];
    
    
}


// Play the Home Button Sound

- (IBAction) homeButton {
    
    NSString *path = nil;
    
    path = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"mp3"];
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [theAudio prepareToPlay];
    theAudio.delegate = self;
    [theAudio play];
    
    
}




//Segue from I to H


-(IBAction)IToH:(UIStoryboardSegue *)IToH {
    //do stuff
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
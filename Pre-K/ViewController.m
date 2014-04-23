//
//  ViewController.m
//  Pre-K
//
//  Created by Nathan Burgess on 4/16/14.
//  Copyright (c) 2014 Nathan Burgess. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>



@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad

{
    
    red = 0/255.0;
    green = 0/255.0;
    blue = 0/255.0;
    brush = 8.0;
    opacity = 1.0;
    
    
    
    [super viewDidLoad];
    
    
    [self.clouds setBackgroundImage: [UIImage
        animatedImageNamed:@"clouds-" duration:6.0]
        forState:UIControlStateNormal];
    
    
	
}







- (IBAction)colorChosen:(id)sender {
    
    
        
        UIButton * PressedButton = (UIButton*)sender;
        
        switch(PressedButton.tag)
        {
            case 0:
                red = 247.0/255.0;
                green = 148.0/255.0;
                blue = 30.0/255.0;
                break;
            case 1:
                red = 0.0/255.0;
                green = 0.0/255.0;
                blue = 255.0/255.0;
                break;
            case 2:
                red = 255.0/255.0;
                green = 255.0/255.0;
                blue = 0.0/255.0;
                break;
            case 3:
                red = 134.0/255.0;
                green = 50.0/255.0;
                blue = 140.0/255.0;
                break;
            case 4:
                red = 0.0/255.0;
                green = 255.0/255.0;
                blue = 0.0/255.0;
                break;
            case 5:
                red = 255.0/255.0;
                green = 0.0/255.0;
                blue = 0.0/255.0;
                break;
            case 6:
                red = 255.0/255.0;
                green = 255.0/255.0;
                blue = 255.0/255.0;
                break;
            case 7:
                red = 0.0/255.0;
                green = 0.0/255.0;
                blue = 0.0/255.0;
                break;
            case 8:
                red = 242.0/255.0;
                green = 126.0/255.0;
                blue = 179.0/255.0;
                break;
            case 9:
                red = 139.0/255.0;
                green = 94.0/255.0;
                blue = 60.0/255.0;
                break;
        }
    }
    
    
    
    
    
    
    
    


- (IBAction)eraseCanvas:(id)sender {
    
    self->mainImage.image = nil;
    
}






// Play the Home Button Sound

- (IBAction) navigationButton {
    
    NSString *path = nil;
    
    path = [[NSBundle mainBundle] pathForResource:@"navigation_button" ofType:@"mp3"];
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [theAudio prepareToPlay];
    theAudio.delegate = self;
    [theAudio play];
    
    
}


//Drawing code

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self->tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self->tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self->tempDrawImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self->tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self->tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self->mainImage.frame.size);
    [self->mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self->tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self->mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self->tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

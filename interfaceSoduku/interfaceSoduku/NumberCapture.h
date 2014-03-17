//
//  NumberCapture.h
//  interfaceSoduku
//
//  Created by Dun on 17/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RetroFilter.h"
#import <opencv2/highgui/ios.h>

@interface NumberCapture : UIViewController<CvPhotoCameraDelegate>
{
    CvPhotoCamera *photoCamera;
    UIImageView *resultView;
    RetroFilter::Parameters params;
}

@property (nonatomic, strong) CvPhotoCamera *photoCamera;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startCaptureButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *takePhotoButton;

- (IBAction)startCaptureButtonPressed:(id)sender;
- (IBAction)takePhotoButtonPressed:(id)sender;

-(UIImage *) applyEffect:(UIImage *)image;


@end

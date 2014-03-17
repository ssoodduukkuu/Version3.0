//
//  NumberCapture.m
//  interfaceSoduku
//
//  Created by Dun on 17/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import "NumberCapture.h"

@interface NumberCapture ()

@end

@implementation NumberCapture
@synthesize photoCamera,imageView,toolbar,startCaptureButton,takePhotoButton;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    photoCamera = [[CvPhotoCamera alloc] initWithParentView:imageView];
    photoCamera.delegate=self;
    photoCamera.defaultAVCaptureDevicePosition=AVCaptureDevicePositionBack;
    photoCamera.defaultAVCaptureSessionPreset=AVCaptureSessionPresetPhoto;
    photoCamera.defaultAVCaptureVideoOrientation=AVCaptureVideoOrientationPortrait;
    
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"scratches" ofType:@"png"];
    UIImage *resImage=[UIImage imageWithContentsOfFile:filePath];
    UIImageToMat(resImage, params.scratches);
    
    filePath=[[NSBundle mainBundle] pathForResource:@"fuzzyBorder" ofType:@"png"];
    UIImageToMat(resImage, params.fuzzyBorder);
    
    [takePhotoButton setEnabled:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startCaptureButtonPressed:(id)sender {
    [photoCamera start];
    
    [self.view addSubview:imageView];
    [takePhotoButton setEnabled:YES];
    [startCaptureButton setEnabled:NO];
    
}

- (IBAction)takePhotoButtonPressed:(id)sender {
    NSString *take=@"Take";
    NSString *leave=@"Leave";
    if (takePhotoButton.title==take) {
        [takePhotoButton setTitle:leave];
        [photoCamera takePicture];
    }
    else
    {
        [takePhotoButton setTitle:take];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void) photoCamera:(CvPhotoCamera *)photoCamera capturedImage:(UIImage *)image
{
    [photoCamera stop];
    resultView=[[UIImageView alloc] initWithFrame:imageView.bounds];
    UIImage * result=[self applyEffect:image];
    
    [resultView setImage:result];
    [self.view addSubview:resultView];
    
    [takePhotoButton setEnabled:NO];
    [startCaptureButton setEnabled:YES];
}

-(void) photoCameraCancel:(CvPhotoCamera *)photoCamera
{
    
}

-(UIImage *) applyEffect:(UIImage *)image
{
    cv::Size frameSize(image.size.width, image.size.height);
    params.frameSize=frameSize;
    
    cv::Mat frame,finalFrame;
    UIImageToMat(image, frame);
    
    RetroFilter retroFilter(params);
    retroFilter.applyToPhoto(frame, finalFrame);
    
    UIImage *resImage=MatToUIImage(finalFrame);
    return [UIImage imageWithCGImage:[resImage CGImage] scale:1.0 orientation:UIImageOrientationLeftMirrored];
}

-(void) viewDidAppear:(BOOL)animated
{
    [photoCamera stop];
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

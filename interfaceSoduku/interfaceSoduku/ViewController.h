//
//  ViewController.h
//  interfaceSoduku
//
//  Created by Dun on 06/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "opencv2/highgui/ios.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Soudu_corp.h"

@interface ViewController : UIViewController <UIAlertViewDelegate ,UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *LTime;

@property (strong, nonatomic) IBOutlet UITextField *_00;
@property (strong, nonatomic) IBOutlet UITextField *_01;
@property (strong, nonatomic) IBOutlet UITextField *_02;
@property (strong, nonatomic) IBOutlet UITextField *_10;
@property (strong, nonatomic) IBOutlet UITextField *_11;
@property (strong, nonatomic) IBOutlet UITextField *_12;
@property (strong, nonatomic) IBOutlet UITextField *_20;
@property (strong, nonatomic) IBOutlet UITextField *_21;
@property (strong, nonatomic) IBOutlet UITextField *_22;

@property (strong, nonatomic) IBOutlet UITextField *_03;
@property (strong, nonatomic) IBOutlet UITextField *_04;
@property (strong, nonatomic) IBOutlet UITextField *_05;
@property (strong, nonatomic) IBOutlet UITextField *_13;
@property (strong, nonatomic) IBOutlet UITextField *_14;
@property (strong, nonatomic) IBOutlet UITextField *_15;
@property (strong, nonatomic) IBOutlet UITextField *_23;
@property (strong, nonatomic) IBOutlet UITextField *_24;
@property (strong, nonatomic) IBOutlet UITextField *_25;

@property (strong, nonatomic) IBOutlet UITextField *_06;
@property (strong, nonatomic) IBOutlet UITextField *_07;
@property (strong, nonatomic) IBOutlet UITextField *_08;
@property (strong, nonatomic) IBOutlet UITextField *_16;
@property (strong, nonatomic) IBOutlet UITextField *_17;
@property (strong, nonatomic) IBOutlet UITextField *_18;
@property (strong, nonatomic) IBOutlet UITextField *_26;
@property (strong, nonatomic) IBOutlet UITextField *_27;
@property (strong, nonatomic) IBOutlet UITextField *_28;

@property (strong, nonatomic) IBOutlet UITextField *_30;
@property (strong, nonatomic) IBOutlet UITextField *_31;
@property (strong, nonatomic) IBOutlet UITextField *_32;
@property (strong, nonatomic) IBOutlet UITextField *_40;
@property (strong, nonatomic) IBOutlet UITextField *_41;
@property (strong, nonatomic) IBOutlet UITextField *_42;
@property (strong, nonatomic) IBOutlet UITextField *_50;
@property (strong, nonatomic) IBOutlet UITextField *_51;
@property (strong, nonatomic) IBOutlet UITextField *_52;

@property (strong, nonatomic) IBOutlet UITextField *_33;
@property (strong, nonatomic) IBOutlet UITextField *_34;
@property (strong, nonatomic) IBOutlet UITextField *_35;
@property (strong, nonatomic) IBOutlet UITextField *_43;
@property (strong, nonatomic) IBOutlet UITextField *_44;
@property (strong, nonatomic) IBOutlet UITextField *_45;
@property (strong, nonatomic) IBOutlet UITextField *_53;
@property (strong, nonatomic) IBOutlet UITextField *_54;
@property (strong, nonatomic) IBOutlet UITextField *_55;

@property (strong, nonatomic) IBOutlet UITextField *_36;
@property (strong, nonatomic) IBOutlet UITextField *_37;
@property (strong, nonatomic) IBOutlet UITextField *_38;
@property (strong, nonatomic) IBOutlet UITextField *_46;
@property (strong, nonatomic) IBOutlet UITextField *_47;
@property (strong, nonatomic) IBOutlet UITextField *_48;
@property (strong, nonatomic) IBOutlet UITextField *_56;
@property (strong, nonatomic) IBOutlet UITextField *_57;
@property (strong, nonatomic) IBOutlet UITextField *_58;

@property (strong, nonatomic) IBOutlet UITextField *_60;
@property (strong, nonatomic) IBOutlet UITextField *_61;
@property (strong, nonatomic) IBOutlet UITextField *_62;
@property (strong, nonatomic) IBOutlet UITextField *_70;
@property (strong, nonatomic) IBOutlet UITextField *_71;
@property (strong, nonatomic) IBOutlet UITextField *_72;
@property (strong, nonatomic) IBOutlet UITextField *_80;
@property (strong, nonatomic) IBOutlet UITextField *_81;
@property (strong, nonatomic) IBOutlet UITextField *_82;

@property (strong, nonatomic) IBOutlet UITextField *_63;
@property (strong, nonatomic) IBOutlet UITextField *_64;
@property (strong, nonatomic) IBOutlet UITextField *_65;
@property (strong, nonatomic) IBOutlet UITextField *_73;
@property (strong, nonatomic) IBOutlet UITextField *_74;
@property (strong, nonatomic) IBOutlet UITextField *_75;
@property (strong, nonatomic) IBOutlet UITextField *_83;
@property (strong, nonatomic) IBOutlet UITextField *_84;
@property (strong, nonatomic) IBOutlet UITextField *_85;

@property (strong, nonatomic) IBOutlet UITextField *_66;
@property (strong, nonatomic) IBOutlet UITextField *_67;
@property (strong, nonatomic) IBOutlet UITextField *_68;
@property (strong, nonatomic) IBOutlet UITextField *_76;
@property (strong, nonatomic) IBOutlet UITextField *_77;
@property (strong, nonatomic) IBOutlet UITextField *_78;
@property (strong, nonatomic) IBOutlet UITextField *_86;
@property (strong, nonatomic) IBOutlet UITextField *_87;
@property (strong, nonatomic) IBOutlet UITextField *_88;

@property (strong, nonatomic) IBOutlet UIButton *GenerateClearButton;


- (IBAction)Generate_Click:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)Clear_All:(id)sender;


@end

//
//  ViewController.m
//  interfaceSoduku
//
//  Created by Dun on 06/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    Soudu_corp *soduku;
    int level[9][9];
    NSString *number;
}

@synthesize ScanButton,GenerateButton,LTime,_00,_01,_02,_03,_04,_05,_06,_07,_08,
            _10,_11,_12,_13,_14,_15,_16,_17,_18,
            _20,_21,_22,_23,_24,_25,_26,_27,_28,
            _30,_31,_32,_33,_34,_35,_36,_37,_38,
            _40,_41,_42,_43,_44,_45,_46,_47,_48,
            _50,_51,_52,_53,_54,_55,_56,_57,_58,
            _60,_61,_62,_63,_64,_65,_66,_67,_68,
            _70,_71,_72,_73,_74,_75,_76,_77,_78,
            _80,_81,_82,_83,_84,_85,_86,_87,_88;

- (void)viewDidLoad
{
    soduku=[[Soudu_corp alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Generate_Click:(id)sender {
    int64 timeStart=cv::getTickCount();
    for (int i=0; i<81; i++) {
        switch (i) {
            case 0:
                level[0][0]=[[_00 text] intValue];
                break;
            case 1:
                level[0][1]=[[_01 text] intValue];
                break;
            case 2:
                level[0][2]=[[_02 text] intValue];
                break;
            case 3:
                level[0][3]=[[_03 text] intValue];
                break;
            case 4:
                level[0][4]=[[_04 text] intValue];
                break;
            case 5:
                level[0][5]=[[_05 text] intValue];
                break;
            case 6:
                level[0][6]=[[_06 text] intValue];
                break;
            case 7:
                level[0][7]=[[_07 text] intValue];
                break;
            case 8:
                level[0][8]=[[_08 text] intValue];
                break;
                
            case 9:
                level[1][0]=[[_10 text] intValue];
                break;
            case 10:
                level[1][1]=[[_11 text] intValue];
                break;
            case 11:
                level[1][2]=[[_12 text] intValue];
                break;
            case 12:
                level[1][3]=[[_13 text] intValue];
                break;
            case 13:
                level[1][4]=[[_14 text] intValue];
                break;
            case 14:
                level[1][5]=[[_15 text] intValue];
                break;
            case 15:
                level[1][6]=[[_16 text] intValue];
                break;
            case 16:
                level[1][7]=[[_17 text] intValue];
                break;
            case 17:
                level[1][8]=[[_18 text] intValue];
                break;
                
            case 18:
                level[2][0]=[[_20 text] intValue];
                break;
            case 19:
                level[2][1]=[[_21 text] intValue];
                break;
            case 20:
                level[2][2]=[[_22 text] intValue];
                break;
            case 21:
                level[2][3]=[[_23 text] intValue];
                break;
            case 22:
                level[2][4]=[[_24 text] intValue];
                break;
            case 23:
                level[2][5]=[[_25 text] intValue];
                break;
            case 24:
                level[2][6]=[[_26 text] intValue];
                break;
            case 25:
                level[2][7]=[[_27 text] intValue];
                break;
            case 26:
                level[2][8]=[[_28 text] intValue];
                break;
                
            case 27:
                level[3][0]=[[_30 text] intValue];
                break;
            case 28:
                level[3][1]=[[_31 text] intValue];
                break;
            case 29:
                level[3][2]=[[_32 text] intValue];
                break;
            case 30:
                level[3][3]=[[_33 text] intValue];
                break;
            case 31:
                level[3][4]=[[_34 text] intValue];
                break;
            case 32:
                level[3][5]=[[_35 text] intValue];
                break;
            case 33:
                level[3][6]=[[_36 text] intValue];
                break;
            case 34:
                level[3][7]=[[_37 text] intValue];
                break;
            case 35:
                level[3][8]=[[_38 text] intValue];
                break;
                
            case 36:
                level[4][0]=[[_40 text] intValue];
                break;
            case 37:
                level[4][1]=[[_41 text] intValue];
                break;
            case 38:
                level[4][2]=[[_42 text] intValue];
                break;
            case 39:
                level[4][3]=[[_43 text] intValue];
                break;
            case 40:
                level[4][4]=[[_44 text] intValue];
                break;
            case 41:
                level[4][5]=[[_45 text] intValue];
                break;
            case 42:
                level[4][6]=[[_46 text] intValue];
                break;
            case 43:
                level[4][7]=[[_47 text] intValue];
                break;
            case 44:
                level[4][8]=[[_48 text] intValue];
                break;
                
            case 45:
                level[5][0]=[[_50 text] intValue];
                break;
            case 46:
                level[5][1]=[[_51 text] intValue];
                break;
            case 47:
                level[5][2]=[[_52 text] intValue];
                break;
            case 48:
                level[5][3]=[[_53 text] intValue];
                break;
            case 49:
                level[5][4]=[[_54 text] intValue];
                break;
            case 50:
                level[5][5]=[[_55 text] intValue];
                break;
            case 51:
                level[5][6]=[[_56 text] intValue];
                break;
            case 52:
                level[5][7]=[[_57 text] intValue];
                break;
            case 53:
                level[5][8]=[[_58 text] intValue];
                break;
                
            case 54:
                level[6][0]=[[_60 text] intValue];
                break;
            case 55:
                level[6][1]=[[_61 text] intValue];
                break;
            case 56:
                level[6][2]=[[_62 text] intValue];
                break;
            case 57:
                level[6][3]=[[_63 text] intValue];
                break;
            case 58:
                level[6][4]=[[_64 text] intValue];
                break;
            case 59:
                level[6][5]=[[_65 text] intValue];
                break;
            case 60:
                level[6][6]=[[_66 text] intValue];
                break;
            case 61:
                level[6][7]=[[_67 text] intValue];
                break;
            case 62:
                level[6][8]=[[_68 text] intValue];
                break;
                
            case 63:
                level[7][0]=[[_70 text] intValue];
                break;
            case 64:
                level[7][1]=[[_71 text] intValue];
                break;
            case 65:
                level[7][2]=[[_72 text] intValue];
                break;
            case 66:
                level[7][3]=[[_73 text] intValue];
                break;
            case 67:
                level[7][4]=[[_74 text] intValue];
                break;
            case 68:
                level[7][5]=[[_75 text] intValue];
                break;
            case 69:
                level[7][6]=[[_76 text] intValue];
                break;
            case 70:
                level[7][7]=[[_77 text] intValue];
                break;
            case 71:
                level[7][8]=[[_78 text] intValue];
                break;
                
            case 72:
                level[8][0]=[[_80 text] intValue];
                break;
            case 73:
                level[8][1]=[[_81 text] intValue];
                break;
            case 74:
                level[8][2]=[[_82 text] intValue];
                break;
            case 75:
                level[8][3]=[[_83 text] intValue];
                break;
            case 76:
                level[8][4]=[[_84 text] intValue];
                break;
            case 77:
                level[8][5]=[[_85 text] intValue];
                break;
            case 78:
                level[8][6]=[[_86 text] intValue];
                break;
            case 79:
                level[8][7]=[[_87 text] intValue];
                break;
            case 80:
                level[8][8]=[[_88 text] intValue];
                break;
                
            default:
                break;
        }
    }
    
    [soduku setSoudu_corp:level];
    [soduku Init_Seeds];
    [soduku Sorted_List];
    
    if ([soduku Is_legal] && [soduku Fill_List:[[soduku getList_Tab] objectAtIndex:[soduku first]]]) {
        [_00 setText:[soduku getList_Tab:0]];
        [_01 setText:[soduku getList_Tab:1]];
        [_02 setText:[soduku getList_Tab:2]];
        [_03 setText:[soduku getList_Tab:3]];
        [_04 setText:[soduku getList_Tab:4]];
        [_05 setText:[soduku getList_Tab:5]];
        [_06 setText:[soduku getList_Tab:6]];
        [_07 setText:[soduku getList_Tab:7]];
        [_08 setText:[soduku getList_Tab:8]];
        
        [_10 setText:[soduku getList_Tab:9]];
        [_11 setText:[soduku getList_Tab:10]];
        [_12 setText:[soduku getList_Tab:11]];
        [_13 setText:[soduku getList_Tab:12]];
        [_14 setText:[soduku getList_Tab:13]];
        [_15 setText:[soduku getList_Tab:14]];
        [_16 setText:[soduku getList_Tab:15]];
        [_17 setText:[soduku getList_Tab:16]];
        [_18 setText:[soduku getList_Tab:17]];
        
        [_20 setText:[soduku getList_Tab:18]];
        [_21 setText:[soduku getList_Tab:19]];
        [_22 setText:[soduku getList_Tab:20]];
        [_23 setText:[soduku getList_Tab:21]];
        [_24 setText:[soduku getList_Tab:22]];
        [_25 setText:[soduku getList_Tab:23]];
        [_26 setText:[soduku getList_Tab:24]];
        [_27 setText:[soduku getList_Tab:25]];
        [_28 setText:[soduku getList_Tab:26]];
        
        [_30 setText:[soduku getList_Tab:27]];
        [_31 setText:[soduku getList_Tab:28]];
        [_32 setText:[soduku getList_Tab:29]];
        [_33 setText:[soduku getList_Tab:30]];
        [_34 setText:[soduku getList_Tab:31]];
        [_35 setText:[soduku getList_Tab:32]];
        [_36 setText:[soduku getList_Tab:33]];
        [_37 setText:[soduku getList_Tab:34]];
        [_38 setText:[soduku getList_Tab:35]];
        
        [_40 setText:[soduku getList_Tab:36]];
        [_41 setText:[soduku getList_Tab:37]];
        [_42 setText:[soduku getList_Tab:38]];
        [_43 setText:[soduku getList_Tab:39]];
        [_44 setText:[soduku getList_Tab:40]];
        [_45 setText:[soduku getList_Tab:41]];
        [_46 setText:[soduku getList_Tab:42]];
        [_47 setText:[soduku getList_Tab:43]];
        [_48 setText:[soduku getList_Tab:44]];
        
        [_50 setText:[soduku getList_Tab:45]];
        [_51 setText:[soduku getList_Tab:46]];
        [_52 setText:[soduku getList_Tab:47]];
        [_53 setText:[soduku getList_Tab:48]];
        [_54 setText:[soduku getList_Tab:49]];
        [_55 setText:[soduku getList_Tab:50]];
        [_56 setText:[soduku getList_Tab:51]];
        [_57 setText:[soduku getList_Tab:52]];
        [_58 setText:[soduku getList_Tab:53]];
        
        [_60 setText:[soduku getList_Tab:54]];
        [_61 setText:[soduku getList_Tab:55]];
        [_62 setText:[soduku getList_Tab:56]];
        [_63 setText:[soduku getList_Tab:57]];
        [_64 setText:[soduku getList_Tab:58]];
        [_65 setText:[soduku getList_Tab:59]];
        [_66 setText:[soduku getList_Tab:60]];
        [_67 setText:[soduku getList_Tab:61]];
        [_68 setText:[soduku getList_Tab:62]];
        
        [_70 setText:[soduku getList_Tab:63]];
        [_71 setText:[soduku getList_Tab:64]];
        [_72 setText:[soduku getList_Tab:65]];
        [_73 setText:[soduku getList_Tab:66]];
        [_74 setText:[soduku getList_Tab:67]];
        [_75 setText:[soduku getList_Tab:68]];
        [_76 setText:[soduku getList_Tab:69]];
        [_77 setText:[soduku getList_Tab:70]];
        [_78 setText:[soduku getList_Tab:71]];
        
        [_80 setText:[soduku getList_Tab:72]];
        [_81 setText:[soduku getList_Tab:73]];
        [_82 setText:[soduku getList_Tab:74]];
        [_83 setText:[soduku getList_Tab:75]];
        [_84 setText:[soduku getList_Tab:76]];
        [_85 setText:[soduku getList_Tab:77]];
        [_86 setText:[soduku getList_Tab:78]];
        [_87 setText:[soduku getList_Tab:79]];
        [_88 setText:[soduku getList_Tab:80]];
        
    }
    else
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle:@"Warning !" message:@"Some of the numbers are entered twice or more !" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertDialog show];
    }
    int64 timeEnd=cv::getTickCount();
    float time=1000.f*float(timeEnd-timeStart)/cv::getTickFrequency();
    LTime.text=[NSString stringWithFormat:@"%f",time];
}

- (IBAction)hideKeyboard:(id)sender {
    [self._00 resignFirstResponder];
    [self._01 resignFirstResponder];
    [self._02 resignFirstResponder];
    [self._03 resignFirstResponder];
    [self._04 resignFirstResponder];
    [self._05 resignFirstResponder];
    [self._06 resignFirstResponder];
    [self._07 resignFirstResponder];
    [self._08 resignFirstResponder];
    
    [self._10 resignFirstResponder];
    [self._11 resignFirstResponder];
    [self._12 resignFirstResponder];
    [self._13 resignFirstResponder];
    [self._14 resignFirstResponder];
    [self._15 resignFirstResponder];
    [self._16 resignFirstResponder];
    [self._17 resignFirstResponder];
    [self._18 resignFirstResponder];

    [self._20 resignFirstResponder];
    [self._21 resignFirstResponder];
    [self._22 resignFirstResponder];
    [self._23 resignFirstResponder];
    [self._24 resignFirstResponder];
    [self._25 resignFirstResponder];
    [self._26 resignFirstResponder];
    [self._27 resignFirstResponder];
    [self._28 resignFirstResponder];

    [self._30 resignFirstResponder];
    [self._31 resignFirstResponder];
    [self._32 resignFirstResponder];
    [self._33 resignFirstResponder];
    [self._34 resignFirstResponder];
    [self._35 resignFirstResponder];
    [self._36 resignFirstResponder];
    [self._37 resignFirstResponder];
    [self._38 resignFirstResponder];

    [self._40 resignFirstResponder];
    [self._41 resignFirstResponder];
    [self._42 resignFirstResponder];
    [self._43 resignFirstResponder];
    [self._44 resignFirstResponder];
    [self._45 resignFirstResponder];
    [self._46 resignFirstResponder];
    [self._47 resignFirstResponder];
    [self._48 resignFirstResponder];

    [self._50 resignFirstResponder];
    [self._51 resignFirstResponder];
    [self._52 resignFirstResponder];
    [self._53 resignFirstResponder];
    [self._54 resignFirstResponder];
    [self._55 resignFirstResponder];
    [self._56 resignFirstResponder];
    [self._57 resignFirstResponder];
    [self._58 resignFirstResponder];

    [self._60 resignFirstResponder];
    [self._61 resignFirstResponder];
    [self._62 resignFirstResponder];
    [self._63 resignFirstResponder];
    [self._64 resignFirstResponder];
    [self._65 resignFirstResponder];
    [self._66 resignFirstResponder];
    [self._67 resignFirstResponder];
    [self._68 resignFirstResponder];

    [self._70 resignFirstResponder];
    [self._71 resignFirstResponder];
    [self._72 resignFirstResponder];
    [self._73 resignFirstResponder];
    [self._74 resignFirstResponder];
    [self._75 resignFirstResponder];
    [self._76 resignFirstResponder];
    [self._77 resignFirstResponder];
    [self._78 resignFirstResponder];

    [self._80 resignFirstResponder];
    [self._81 resignFirstResponder];
    [self._82 resignFirstResponder];
    [self._83 resignFirstResponder];
    [self._84 resignFirstResponder];
    [self._85 resignFirstResponder];
    [self._86 resignFirstResponder];
    [self._87 resignFirstResponder];
    [self._88 resignFirstResponder];

}

- (IBAction)Clear_All:(id)sender {
    LTime.text=@"";
    for (int i=0; i<81; i++) {
        level[i/9][i%9]=0;
    }
    [soduku setSoudu_corp:level];
    
    [_00 setText:[soduku getList_Tab:0]];
    [_01 setText:[soduku getList_Tab:1]];
    [_02 setText:[soduku getList_Tab:2]];
    [_03 setText:[soduku getList_Tab:3]];
    [_04 setText:[soduku getList_Tab:4]];
    [_05 setText:[soduku getList_Tab:5]];
    [_06 setText:[soduku getList_Tab:6]];
    [_07 setText:[soduku getList_Tab:7]];
    [_08 setText:[soduku getList_Tab:8]];
    
    [_10 setText:[soduku getList_Tab:9]];
    [_11 setText:[soduku getList_Tab:10]];
    [_12 setText:[soduku getList_Tab:11]];
    [_13 setText:[soduku getList_Tab:12]];
    [_14 setText:[soduku getList_Tab:13]];
    [_15 setText:[soduku getList_Tab:14]];
    [_16 setText:[soduku getList_Tab:15]];
    [_17 setText:[soduku getList_Tab:16]];
    [_18 setText:[soduku getList_Tab:17]];
    
    [_20 setText:[soduku getList_Tab:18]];
    [_21 setText:[soduku getList_Tab:19]];
    [_22 setText:[soduku getList_Tab:20]];
    [_23 setText:[soduku getList_Tab:21]];
    [_24 setText:[soduku getList_Tab:22]];
    [_25 setText:[soduku getList_Tab:23]];
    [_26 setText:[soduku getList_Tab:24]];
    [_27 setText:[soduku getList_Tab:25]];
    [_28 setText:[soduku getList_Tab:26]];
    
    [_30 setText:[soduku getList_Tab:27]];
    [_31 setText:[soduku getList_Tab:28]];
    [_32 setText:[soduku getList_Tab:29]];
    [_33 setText:[soduku getList_Tab:30]];
    [_34 setText:[soduku getList_Tab:31]];
    [_35 setText:[soduku getList_Tab:32]];
    [_36 setText:[soduku getList_Tab:33]];
    [_37 setText:[soduku getList_Tab:34]];
    [_38 setText:[soduku getList_Tab:35]];
    
    [_40 setText:[soduku getList_Tab:36]];
    [_41 setText:[soduku getList_Tab:37]];
    [_42 setText:[soduku getList_Tab:38]];
    [_43 setText:[soduku getList_Tab:39]];
    [_44 setText:[soduku getList_Tab:40]];
    [_45 setText:[soduku getList_Tab:41]];
    [_46 setText:[soduku getList_Tab:42]];
    [_47 setText:[soduku getList_Tab:43]];
    [_48 setText:[soduku getList_Tab:44]];
    
    [_50 setText:[soduku getList_Tab:45]];
    [_51 setText:[soduku getList_Tab:46]];
    [_52 setText:[soduku getList_Tab:47]];
    [_53 setText:[soduku getList_Tab:48]];
    [_54 setText:[soduku getList_Tab:49]];
    [_55 setText:[soduku getList_Tab:50]];
    [_56 setText:[soduku getList_Tab:51]];
    [_57 setText:[soduku getList_Tab:52]];
    [_58 setText:[soduku getList_Tab:53]];
    
    [_60 setText:[soduku getList_Tab:54]];
    [_61 setText:[soduku getList_Tab:55]];
    [_62 setText:[soduku getList_Tab:56]];
    [_63 setText:[soduku getList_Tab:57]];
    [_64 setText:[soduku getList_Tab:58]];
    [_65 setText:[soduku getList_Tab:59]];
    [_66 setText:[soduku getList_Tab:60]];
    [_67 setText:[soduku getList_Tab:61]];
    [_68 setText:[soduku getList_Tab:62]];
    
    [_70 setText:[soduku getList_Tab:63]];
    [_71 setText:[soduku getList_Tab:64]];
    [_72 setText:[soduku getList_Tab:65]];
    [_73 setText:[soduku getList_Tab:66]];
    [_74 setText:[soduku getList_Tab:67]];
    [_75 setText:[soduku getList_Tab:68]];
    [_76 setText:[soduku getList_Tab:69]];
    [_77 setText:[soduku getList_Tab:70]];
    [_78 setText:[soduku getList_Tab:71]];
    
    [_80 setText:[soduku getList_Tab:72]];
    [_81 setText:[soduku getList_Tab:73]];
    [_82 setText:[soduku getList_Tab:74]];
    [_83 setText:[soduku getList_Tab:75]];
    [_84 setText:[soduku getList_Tab:76]];
    [_85 setText:[soduku getList_Tab:77]];
    [_86 setText:[soduku getList_Tab:78]];
    [_87 setText:[soduku getList_Tab:79]];
    [_88 setText:[soduku getList_Tab:80]];

}

- (IBAction)ScanButton_Click:(id)sender {
    
}
@end

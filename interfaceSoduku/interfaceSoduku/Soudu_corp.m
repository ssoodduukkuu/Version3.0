//
//  Soudu_corp.m
//  interfaceSoduku
//
//  Created by Dun on 07/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import "Soudu_corp.h"

@implementation Soudu_corp
{
    //List<Seed> List_Tab=new ArrayList<Seed>();
    NSMutableArray *List_Tab;
    //Vector<Integer> List_Order=new Vector<Integer>();
    //NSMutableArray *List_Order;
    int List_Order[81];
    //Vector<Integer> Init_T=new Vector<Integer>();
    NSMutableArray *Init_T;
    NSNumber *number;
    Seed *_seed;
}

-(void) setSoudu_corp:(int [9][9])level
{
    List_Tab=[[NSMutableArray alloc] init];
    //List_Order=[[NSMutableArray alloc] init];
    Init_T=[[NSMutableArray alloc] init];
    
    
    for (int i=0; i<81; i++) {
        _seed=[[Seed alloc] init];
        [_seed setX:i/9 andY:i%9 andvalue:level[i/9][i%9]];
        if (level[i/9][i%9]!=0) {
            number=[NSNumber numberWithInt:i];
            [Init_T addObject:number];
        }
        [List_Tab addObject:_seed];
    }
}

-(BOOL) Is_legal
{
    BOOL flag=YES;
    
    for (NSNumber *p in [Init_T reverseObjectEnumerator]) {
        if (![self Check_Seed:[p intValue]]) {
            flag=NO;
        }
    }
    
    return flag;
}

-(BOOL) Is_in:(int)p
{
    BOOL flag=NO;
    for (NSNumber *i in [Init_T reverseObjectEnumerator]) {
        if (p==[i intValue]) {
            flag=YES;
        }
    }
    return flag;
}

-(void) Init_Seeds
{
    for (Seed *seed in [List_Tab reverseObjectEnumerator]) {
        int p=seed.X*9+seed.Y;
        if (![self Is_in:p]) {
            for (int i=0; i<9; i++) {
                if ([[List_Tab objectAtIndex:p-(p%9)+i] getV_Value]!=0) {
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-(p%9)+i] getV_Value]];
                }
            }
            for (int i=0; i<9; i++) {
                if ([[List_Tab objectAtIndex:9*i+p%9] getV_Value]!=0) {
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+(i-p/9)*9] getV_Value]];
                }
            }
            if (((p/9)%3==0)&&((p%9)%3==0)) {
                if([[List_Tab objectAtIndex:p+10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+11] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+11] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+19] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+19] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+20] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+20] getV_Value]];
                }
            }
            else if (((p/9)%3==0)&&((p%9)%3==1)) {
                if([[List_Tab objectAtIndex:p+8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+17] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+17] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+19] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+19] getV_Value]];
                }
            }
            else if (((p/9)%3==0)&&((p%9)%3==2)) {
                if([[List_Tab objectAtIndex:p+7] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+7] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+16] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+16] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+17] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+17] getV_Value]];
                }
            }
            else if (((p/9)%3==1)&&((p%9)%3==0)) {
                if([[List_Tab objectAtIndex:p-8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-7] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-7] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+11] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+11] getV_Value]];
                }
            }
            else if (((p/9)%3==1)&&((p%9)%3==1)) {
                if([[List_Tab objectAtIndex:p-8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+10] getV_Value]];
                }
            }
            else if (((p/9)%3==1)&&((p%9)%3==2)) {
                if([[List_Tab objectAtIndex:p-11] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-11] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+7] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+7] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p+8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p+8] getV_Value]];
                }
            }
            else if (((p/9)%3==2)&&((p%9)%3==0)) {
                if([[List_Tab objectAtIndex:p-17] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-17] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-16] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-16] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-8] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-7] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-7] getV_Value]];
                }
            }
            else if (((p/9)%3==2)&&((p%9)%3==1)) {
                if([[List_Tab objectAtIndex:p-19] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-19] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-17] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-17] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-10] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-8] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-8] getV_Value]];
                }
            }
            else{
                if([[List_Tab objectAtIndex:p-20] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-20] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-19] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-19] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-11] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-11] getV_Value]];
                }
                if([[List_Tab objectAtIndex:p-10] getV_Value]!=0){
                    [seed setV_Maybe:[[List_Tab objectAtIndex:p-10] getV_Value]];
                }
            }
            [seed setV_Maybe];
            seed.K_Original=seed.K_Label;
        }
    }
}

-(void) Sorted_List
{
    NSMutableArray *List_com=[[NSMutableArray alloc] init];
    
    for (Seed * seed in [List_Tab reverseObjectEnumerator]) {
        [List_com addObject: seed];
    }
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"K_Label" ascending:NO];
    [List_com sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    int i=0;
    for (Seed *seed in [List_com reverseObjectEnumerator]) {
        [[List_Tab objectAtIndex:seed.X*9+seed.Y] setOrder:i];
        List_Order[i]=seed.X*9+seed.Y;
        i++;
    }
}

-(BOOL) Check_Seed:(int)p
{
    BOOL flag=YES;
    for (int i=0; i<9 && flag; i++) {
        if (i!=(p%9)&&([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+i-(p%9)] getV_Value]))
        {
            flag=NO;
        }
    }
    for (int i=0; i<9 && flag; i++) {
        if (i!=(p/9)&&([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+(i-p/9)*9] getV_Value]))
        {
            flag=NO;
        }
    }
    if (flag) {
        if (((p/9)%3==0)&&((p%9)%3==0)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+11] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+19] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+20] getV_Value]);
        }
        else if (((p/9)%3==0)&&((p%9)%3==1)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+17] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+19] getV_Value]);
        }
        else if (((p/9)%3==0)&&((p%9)%3==2)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+7] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+16] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+17] getV_Value]);
        }
        else if (((p/9)%3==1)&&((p%9)%3==0)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-7] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+11] getV_Value]);
        }
        else if (((p/9)%3==1)&&((p%9)%3==1)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+10] getV_Value]);
        }
        else if (((p/9)%3==1)&&((p%9)%3==2)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-11] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+7] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p+8] getV_Value]);
        }
        else if (((p/9)%3==2)&&((p%9)%3==0)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-17] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-16] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-8] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-7] getV_Value]);
        }
        else if (((p/9)%3==2)&&((p%9)%3==1)) {
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-19] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-17] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-10] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-8] getV_Value]);
        }
        else{
            flag=!([[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-20] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-19] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-11] getV_Value]||[[List_Tab objectAtIndex:p] getV_Value]==[[List_Tab objectAtIndex:p-10] getV_Value]);
        }
    }
    return flag;
}

-(BOOL) Fill_List:(Seed *)it
{
    if (it.K_Label==-2) {
        return [self Fill_List:[List_Tab objectAtIndex:List_Order[it.Order+1]]];
    }
    else
    {
        if ([it hasNext]) {
            if (it.K_Label>=0) {
                it.value=[it getV_Maybe:it.K_Label];
                if ([self Check_Seed:it.X*9+it.Y] && [self Fill_List:[List_Tab objectAtIndex:List_Order[it.Order+1]]]) {
                    return YES;
                }
                else
                {
                    it.K_Label=it.K_Label-1;
                    return [self Fill_List:it];
                }
            }
            else
            {
                it.K_Label=it.K_Original;
                it.value=0;
                return NO;
            }
        }
        else
        {
            if (it.K_Label>=0) {
                it.value=[it getV_Maybe:it.K_Label];
                if ([self Check_Seed:it.X*9+it.Y]) {
                    return YES;
                }
                else
                {
                    it.K_Label=it.K_Label-1;
                    return [self Fill_List:it];
                }
            }
            else
            {
                it.K_Label=it.K_Original;
                it.value=0;
                return NO;
            }
        }
    }
}

-(int) getList_T:(int)indice
{
    return [[List_Tab objectAtIndex:indice] getV_Value];
}

-(NSString *) getList_Tab:(int)indice
{
    return [NSString stringWithFormat:@"%d",[[List_Tab objectAtIndex:indice] getV_Value]];
}

-(NSMutableArray *) getList_Tab
{
    return List_Tab;
}

-(void) Afficher
{
    for (int i=0; i<9; i++)
        for (int j=0; j<9; j++) {
            if ((i*9+j)==27||(i*9+j)==54) {
                printf("\n");
            }
            if (j==8) {
                printf(" %d\n",[self getList_T:i*9+j]);
            }
            else if (j==3||j==6){
                printf("  %d",[self getList_T:i*9+j]);
            }
            else{
                printf(" %d",[self getList_T:i*9+j]);
            }
        }
}

-(int) first
{
    return List_Order[0];
}

@end

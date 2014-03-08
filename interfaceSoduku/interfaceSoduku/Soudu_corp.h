//
//  Soudu_corp.h
//  interfaceSoduku
//
//  Created by Dun on 07/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Seed.h"

@interface Soudu_corp : NSObject

-(void) setSoudu_corp:(int[9][9]) level;
-(void) Init_Seeds;
-(void) Sorted_List;
-(BOOL) Is_in:(int) p;
-(NSString *) getList_Tab:(int) indice;
-(int) getList_T:(int) indice;
-(NSMutableArray *) getList_Tab;
-(BOOL) Check_Seed:(int) p;
-(BOOL) Fill_List:(Seed *) it;
-(int) first;
-(BOOL) Is_legal;
-(void) Afficher;

@end

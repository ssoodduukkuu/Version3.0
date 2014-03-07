//
//  Seed.h
//  interfaceSoduku
//
//  Created by Dun on 07/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Seed : NSObject

@property int X, Y, value, K_Original, K_Label, Order;
/******************************
 X,Y-->indices
 value--> value of this Seed
 K_Original-->the value init of the K_Label, used in case of refill this seed after trying all the maube value
 K_Label--> the position of the last maybe_value in the table of maybe values
 Order--> the position in the sorted list of seeds
 *****************************/

-(void) setV_Maybe:(int) i;
-(void) setV_Maybe;
-(void) setX:(int) x andY:(int) y andvalue:(int) v;
-(BOOL) hasNext;
-(int) getV_Maybe:(int) indice;
-(int) getV_Value;
@end

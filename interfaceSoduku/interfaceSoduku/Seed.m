//
//  Seed.m
//  interfaceSoduku
//
//  Created by Dun on 07/03/2014.
//  Copyright (c) 2014 Dun. All rights reserved.
//

#import "Seed.h"

@implementation Seed
{
    int V_Maybe[9];
}

@synthesize X, Y, value, K_Label, K_Original, Order;

-(void) setV_Maybe:(int)i
{
    K_Label=0;
    V_Maybe[i-1]=i;
}

-(void) setV_Maybe
{
    int v[9];
    K_Label=0;
    for (int i=0; i<9; i++) {
        if (V_Maybe[i]==0) {
            v[K_Label]=i+1;
            K_Label++;
        }
    }
    for (int i=0; i<9; i++) {
        V_Maybe[i]=v[i];
    }
    K_Label--;
}

-(void) setX:(int)x andY:(int)y andvalue:(int)v
{
    X=x;
    Y=y;
    value=v;
    
    K_Label=-2;
    K_Original=0;
    Order=-1;
    for (int i=0; i<9; i++) {
        V_Maybe[i]=0;
    }
}

-(BOOL) hasNext
{
    if (Order==80) {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(int) getV_Maybe:(int)indice
{
    return V_Maybe[indice];
}

-(int) getV_Value
{
    return value;
}
@end

//
//  ViewController.m
//  算法学习
//
//  Created by 王小辉 on 2017/8/14.
//  Copyright © 2017年 王小辉. All rights reserved.
//

#import "ViewController.h"
#import "IndexMaxHeap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IndexMaxHeap *maxHeap = [IndexMaxHeap maxHeapWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        int randNum = arc4random() % 100;
        [maxHeap insertItemAtIndex:i item:@(randNum)];
    }
    
    for (int i = 0; i < 10; i++) {
        int index = maxHeap.extractMaxIndex;
//        id item = maxHeap.extractMax;
        NSLog(@"元素为%@----对应得索引为%d",@"",index);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

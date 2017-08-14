//
//  IndexMaxHeap.h
//  算法学习
//
//  Created by 王小辉 on 2017/8/14.
//  Copyright © 2017年 王小辉. All rights reserved.
//索引最大堆

#import <Foundation/Foundation.h>

@interface IndexMaxHeap : NSObject

/**
 实例化最大堆
 
 @param capacity 堆中的最大容量
 @return 最大堆实例
 */
+ (instancetype)maxHeapWithCapacity:(NSInteger)capacity;

/**
 插入值到最大堆中（入队）
 
 @param item 元素
 */
- (void)insertItem:(id)item;


/**
 插入值到最大堆中（入队）
 @param index 插入的位置
 @param item 元素
 */
- (void)insertItemAtIndex:(int)index item:(id)item;


/**
 从堆中取值（出队）
 
 @return 优先的元素
 */
- (id)extractMax;


/**
 从堆中取值对应的索引（出队）
 
 @return 优先的元素索引
 */
- (int)extractMaxIndex;


/**
 最大堆中的大小
 
 @return 堆容量
 */
- (NSInteger)size;


/**
 判断是否为空堆
 
 @return 是否空堆
 */
- (BOOL)isEmpty;

@end

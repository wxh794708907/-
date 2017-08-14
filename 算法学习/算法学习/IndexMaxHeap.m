//
//  IndexMaxHeap.m
//  算法学习
//
//  Created by 王小辉 on 2017/8/14.
//  Copyright © 2017年 王小辉. All rights reserved.
//索引最大堆

#import "IndexMaxHeap.h"

@interface IndexMaxHeap ()
/** 堆容量 */
@property(nonatomic,assign) NSInteger capacity;
/** 数据个数*/
@property(nonatomic,assign) int count;
/** item容器 */
@property(nonatomic,strong) NSMutableArray *itemsArray;
/** 索引容器 */
@property(nonatomic,strong) NSMutableArray *indexArray;


@end

@implementation IndexMaxHeap

+ (instancetype)maxHeapWithCapacity:(NSInteger)capacity {
    IndexMaxHeap *maxHeap = [[IndexMaxHeap alloc]init];
    maxHeap.capacity = capacity;
    maxHeap.count = 0;
    return maxHeap;
}

- (void)insertItem:(id)item {
    if (self.count >= self.capacity) {
        //这里也可以用断言
        NSLog(@"容量已满");
        return;
    }
    //添加元素
    [self.itemsArray addObject:item];
    //元素个数++
    self.count++;
    //执行shiftUp操作
    [self shiftUp:_count];
}

- (void)insertItemAtIndex:(int)index item:(id)item {
    //防止越界、索引必须存在
    if (self.count >= self.capacity || index + 1 < 1 || index + 1 > _capacity) {
        NSLog(@"超出容量位置");
        return;
    }
    //外界用户使用时是从0开始的 所以我们这里加1 和外界统一
    index +=1;
    //将元素item插入到数组中
    [self.itemsArray insertObject:item atIndex:index];
    [self.indexArray insertObject:@(index) atIndex:self.count + 1];
    //元素个数++
    self.count++;
    //执行shiftUp操作让数组保持最大堆得性质
    [self shiftUp:_count];
}


- (int)extractMaxIndex{
    if (self.count <= 0) {
        NSLog(@"无法取出元素---堆中元素已全部取出");
        return -1;
    }
    
    //取出元素
    int index = [self.indexArray[1] intValue];
    NSLog(@"%@",self.itemsArray[[_indexArray[1] intValue]]);
    [self.indexArray exchangeObjectAtIndex:1 withObjectAtIndex:_count];
    _count--;
    //执行shiftDown操作让数组仍然保持最大堆的性质
    [self shiftDown:1];
    return index;
    
}


- (id)extractMax {
    if (self.count <= 0) {
        NSLog(@"无法取出元素---堆中元素已全部取出");
        return nil;
    }
    //将当前最大的数也就是第一个元素取出来
    id item = self.itemsArray[[_indexArray[1] intValue]];
    //将最后一个元素放到第一位
    [self.indexArray exchangeObjectAtIndex:1 withObjectAtIndex:self.count];
    self.count--;
    //执行shiftDown操作
    [self shiftDown:1];
    return item;
}

- (void)shiftDown:(int)k {
    while (2*k <= _count) {//判断是否有孩子 只要判断的有左孩子就行了
        //声明一个变量初始化为做左孩子的索引
        int j = 2 *k;
        //判断是否右孩子防止越界且比较左孩子和右孩子的值
        if (j + 1 <= _count && _itemsArray[[_indexArray[j] intValue]] < _itemsArray[[_indexArray[j + 1] intValue]]) {
            j += 1;
        }
        //此时itemsArray[j]中存放的就是两个孩子中间最大的元素
        //比较父节点与孩子中最大的值
        if (_itemsArray[[_indexArray[j] intValue]] <= _itemsArray[[_indexArray[k] intValue]]) {
            break;
        }
        //走到这里说明父节点比子节点的值要小 交换位置 更新索引
        [_indexArray exchangeObjectAtIndex:j withObjectAtIndex:k];
        k = j;
    }
}



/**
 不断与父亲节点比较往上升的过程
 
 @param k 比较的索引
 */
- (void)shiftUp:(int)k {
    //当k == 1的时候只有一个元素就可以不用比较了 self.itemsArray[k/2]是父亲节点的值
    while (k > 1 && self.itemsArray[[self.indexArray[k] intValue]] > self.itemsArray[[_indexArray[k/2] intValue]]) {
        //交换位置
        [self.indexArray exchangeObjectAtIndex:k/2 withObjectAtIndex:k];
        //更新索引为父节点的索引
        k /= 2;
    }
}

- (NSInteger)size {
    return self.count;
}


- (BOOL)isEmpty {
    return self.count == 0;
}



#pragma  mark -  懒加载
#pragma  mark -
- (NSMutableArray *)itemsArray {
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray arrayWithCapacity:self.capacity + 1];
        //默认先加入一个元素 也就是第0个元素
        [_itemsArray addObject:@(0)];
    }
    return _itemsArray;
}

- (NSMutableArray *)indexArray {
    if (!_indexArray) {
        _indexArray = [NSMutableArray arrayWithCapacity:self.capacity + 1];
        //默认先加入一个元素 也就是第0个元素
        [_indexArray addObject:@(0)];
    }
    return _indexArray;
}



@end

//
//  main.m
//  project-7-22
//
//  Created by bytedance on 7/22/20.
//

#import <Foundation/Foundation.h>

//--block的使用--

//---block捕获值--
@interface blockCapture : NSObject
-(void)testMethod;
@end

@implementation blockCapture

-(void)testMethod{
    int number = 20;
    void (^test)(void) = ^{
        NSLog(@ "This number is %i.",number);
    };
    number = 40;
    //输出仍然为20，即在定义块时它捕获了number这个值，并且捕获后这个值将不再改变,且块不可以改变numbe的值
    test();
    
}
@end

//--block共享存储--
@interface blockShare : NSObject
-(void)testMethod;
@end

@implementation blockShare
-(void)testMethod{
    __block int number = 20;
    void (^test)(void) = ^{
        NSLog(@ "This number is %i.",number);
    };
    number = 40;
    //输出变为40，因为number为__block变量，它的存储与块共享，块内可以改变number值
    test();
    
}
@end

//--block回调函数--
@interface callback : NSObject
-(void)beginTask:(NSString*)name completion:(void(^)(void))block;
-(void)test;
@end

@implementation callback
-(void)beginTask:(NSString*)name completion:(void(^)(void))block{
    block();
}
-(void)test{
    [self beginTask:@ "mengyu" completion:^{NSLog(@ "This is completed...");}];
}



@end


//--block实现策略模式--
typedef NSInteger(^calculate) (NSInteger,NSInteger);

@interface calculator : NSObject

-(NSInteger)calculateBlock:(calculate) type num1:(NSInteger)num1 num2:(NSInteger)num2;
-(void)test;

@end

@implementation calculator

-(NSInteger)calculateBlock:(calculate)type num1:(NSInteger)num1 num2:(NSInteger)num2{
    return type(num1,num2);
}
-(void)test{
    calculate add = ^NSInteger(NSInteger num1,NSInteger num2){return num1+num2;};
    calculate sub = ^(NSInteger num1,NSInteger num2){return num1-num2;};
    calculate multiple = ^(NSInteger num1,NSInteger num2){
        return num1*num2;
    };
    //把一个block值赋值给block变量
    CGFloat (^divide)(NSInteger,NSInteger) = ^CGFloat(NSInteger num1,NSInteger num2){
        return (CGFloat)num1/(CGFloat)num2;
    };
    NSInteger num1 = 10;
    NSInteger num2 = 20;
    NSLog(@ "%d+%d=%d",(int)num1,(int)num2,(int)[self calculateBlock:add num1:num1 num2:num2]);
    //这种方法也可以
    //NSLog(@ "%d+%d=%d",(int)num1,(int)num2,(int)add(num1,num2));
    NSLog(@ "%d-%d=%d",(int)num1,(int)num2,(int)[self calculateBlock:sub num1:num1 num2:num2]);
    NSLog(@ "%d*%d=%d",(int)num1,(int)num2,(int)[self calculateBlock:multiple num1:num1 num2:num2]);
    NSLog(@ "%d/%d=%f",(int)num1,(int)num2,(float)divide(num1,num2));
    
}

@end

//--block避免循环引用问题--
@interface blockKeeper : NSObject
@property(copy)void(^block)(void);//声明一个block变量
-(void)configureBlock;
-(void)dosomething;
@end

@implementation blockKeeper
-(void)dosomething{
    NSLog(@ "here are you");
}
-(void)configureBlock{
    //这样会出现循环引用的情况
//    self.block = ^{
//        [self dosomething];
//    }
    blockKeeper *__weak weakself = self;
    weakself.block = ^{[self dosomething];};
    self.block();
}

@end
//-----
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        calculator *calculator1 = [[calculator alloc]init];
//        [calculator1 test];
        
//        blockCapture *block = [[blockCapture alloc]init];
//        [block testMethod];
//        blockShare *anotherBlock = [[blockShare alloc] init];
//        [anotherBlock testMethod];
        
//        callback *block1 = [[callback alloc]init];
//        [block1 test];
        
        blockKeeper *block2 = [[blockKeeper alloc]init];
        [block2 configureBlock];
    }
    return 0;
}

//
//  NSObject+SCAvoidCrashCategory.m
//  SourceCode
//
//  Created by 赵鹤 on 2022/9/7.
//

#import "NSObject+SCAvoidCrashCategory.h"

@implementation NSObject (SCAvoidCrashCategory)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
   if ([self respondsToSelector:aSelector]) {
       // 已实现不做处理
       return [self methodSignatureForSelector:aSelector];
   }
   return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
   NSLog(@"在 %@ 类中, 调用了没有实现的实例方法: %@ ", NSStringFromClass([self class]), NSStringFromSelector(anInvocation.selector));
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
   if ([self respondsToSelector:aSelector]) {
       // 已实现不做处理
       return [self methodSignatureForSelector:aSelector];
   }
   return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
   NSLog(@"在 %@ 类中, 调用了没有实现的类方法: %@ ", NSStringFromClass([self class]), NSStringFromSelector(anInvocation.selector));
}

@end

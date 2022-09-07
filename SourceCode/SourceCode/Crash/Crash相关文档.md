#  Crash相关调研文档

## 一、Crash的跟踪
## 二、Crash的上报
## 三、Crash的防护

### NSObject+SCAvoidCrashCategory 为了避免没有实现Category的方法
 
```
 (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
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
```


本工程主要介绍了 高德地图iOS SDK 3D版本 在annotation动画上面的应用
## 前述 ##

- [高德官方网站申请key](http://id.amap.com/?ref=http%3A%2F%2Fapi.amap.com%2Fkey%2F).
- 阅读[开发指南](http://lbs.amap.com/api/ios-sdk/summary/).
- 工程基于iOS 3D地图SDK实现

## 功能描述 ##
基于3D地图SDK，添加自定义annotation，并对annotation做动画

## 核心类/接口 ##
| 类    | 接口  | 说明   | 版本  |
| -----|:-----:|:-----:|:-----:|
| growAnnotationView	| - (void)willMoveToSuperview:(UIView *)newSuperview | 继承自MAAnnotationView，实现了annotation被添加至superView前做动画 | --- |


## 核心难点 ##
### objective-c实现
``` objc

///添加自定义动画
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];

    if (newSuperview == nil) {
        return;
    }

    if (CGRectContainsPoint(newSuperview.bounds, self.center)) {
        CABasicAnimation *growAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        growAnimation.delegate = (id<CAAnimationDelegate>)self;
        growAnimation.duration = 0.5f;
        growAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

        growAnimation.fromValue = [NSNumber numberWithDouble:0.0f];

        growAnimation.toValue = [NSNumber numberWithDouble:1.0f];

        [self.layer addAnimation:growAnimation forKey:@"growAnimation"];
    }
}


```
### swift实现
``` swift
class growAnnotationView: MAAnnotationView, CAAnimationDelegate {
    
    override init!(annotation: MAAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if(newSuperview?.bounds.contains(self.center))! {
            let growAnimation = CABasicAnimation.init(keyPath: "transform.scale")
            growAnimation.delegate = self
            growAnimation.duration = 1.5;
            growAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
            growAnimation.fromValue = 0
            growAnimation.toValue = 1.0
            
            
            self.layer.add(growAnimation, forKey: "growAnimation")
        }
    }

}
```


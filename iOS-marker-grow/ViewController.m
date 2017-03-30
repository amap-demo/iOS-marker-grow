//
//  ViewController.m
//  iOS-marker-grow
//
//  Created by 翁乐 on 29/11/2016.
//  Copyright © 2016 Autonavi. All rights reserved.
//

#import "ViewController.h"
#import "growAnnotationView.h"

@interface ViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
}

@end

@implementation ViewController

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *customReuseIdentifier = @"customReuseIdentifier";
        
        growAnnotationView *annotationView = (growAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIdentifier];
        
        if (annotationView == nil)
        {
            annotationView = [[growAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"growView"];
            
            annotationView.image = [UIImage imageNamed:@"CYAN"];
            annotationView.centerOffset = CGPointMake(0, -(annotationView.image.size.height / 2.0));
            
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    _mapView.allowsAnnotationViewSorting = NO;
    
    [self.view addSubview:_mapView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 120, 32)];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderWidth = 1.0;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.layer.borderColor = [UIColor redColor].CGColor;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"addAnnotation" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(actionAddAnnotation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

- (void)actionAddAnnotation
{
    CGPoint randomPoint = CGPointZero;
    
    randomPoint.x = arc4random() % (int)(CGRectGetWidth(self.view.bounds) - 100);
    randomPoint.y = arc4random() % (int)(CGRectGetHeight(self.view.bounds) - 200);

    CLLocationCoordinate2D randomCoordinate = [_mapView convertPoint:randomPoint toCoordinateFromView:self.view];
    
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = randomCoordinate;
    
    [_mapView addAnnotation:annotation];
}

@end

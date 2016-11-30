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

-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        growAnnotationView *growView = [[growAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"growView"];
        
        growView.image = [UIImage imageNamed:@"CYAN"];
        
        return growView;
    }
    
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    _mapView.centerCoordinate = CLLocationCoordinate2DMake(39.916049, 116.399792);
    
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(39.916049, 116.399792);
    
    [_mapView addAnnotation:annotation];
    
    [self.view addSubview:_mapView];
}


@end

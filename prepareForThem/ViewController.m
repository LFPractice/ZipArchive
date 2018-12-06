//
//  ViewController.m
//  prepareForThem
//
//  Created by 王林芳 on 2018/12/5.
//  Copyright © 2018 王林芳. All rights reserved.
//

#import "ViewController.h"
#import "DrSkinManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [DrSkinManager loadDataForSkinSign];
    
}


@end

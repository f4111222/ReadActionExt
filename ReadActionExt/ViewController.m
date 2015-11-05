//
//  ViewController.m
//  ReadActionExt
//
//  Created by 蔡繼東 on 2015/11/5.
//  Copyright © 2015年 tungtungtsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ActionPressed:(id)sender {
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.textView.text] applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}


@end

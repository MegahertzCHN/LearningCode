//
//  ViewController.m
//  SourceCode
//
//  Created by 赵鹤 on 2022/9/7.
//

#import "ViewController.h"
#import "SCCrashViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testCrash:(id)sender {
    SCCrashViewController *crashVC = [[SCCrashViewController alloc] init];
    [self.navigationController pushViewController:crashVC animated:YES];
}


@end

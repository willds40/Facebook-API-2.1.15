//
//  ViewController.m
//  FaceBook
//
//  Created by Will Devon-sand on 4/7/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // adding photos to be shared
    
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    UIImage *image = [UIImage imageNamed:@"monkey.jpg"];
    photo.image = image;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
    
    // adding share button
    
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;

    //adding contraints programmatically to button
    //Places 50 above bottom of view
    NSLayoutConstraint *buttonConstraint1 = [NSLayoutConstraint constraintWithItem:shareButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50];
    
    //Adds constraints that the buttom is center
    NSLayoutConstraint *buttonConstraint2 = [NSLayoutConstraint constraintWithItem:shareButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:self.view.frame.size.width/2.5];
    
    //Need this to make sure it doesn't resize.
    shareButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:shareButton];
    [self.view addConstraint:buttonConstraint1];
    [self.view addConstraint:buttonConstraint2];
    
    //add login button.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends",@ "publish_actions"];
    [self.view addSubview:loginButton];
    
    
    }
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

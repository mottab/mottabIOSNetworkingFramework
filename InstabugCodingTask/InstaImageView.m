//
//  InstaImageView.m
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/26/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import "InstaImageView.h"

@implementation InstaImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setImageWithURL:(NSURL *)url {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    NSLog(@"%f,%f",self.center.x, self.center.y);
    activityIndicator.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [activityIndicator startAnimating];
        [self addSubview:activityIndicator];
    });
    
    downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@", error.description);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
            [activityIndicator removeFromSuperview];
            self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        });
    }];
    [downloadPhotoTask resume];
}



@end

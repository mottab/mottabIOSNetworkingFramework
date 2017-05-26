//
//  InstaImageView.h
//  InstabugCodingTask
//
//  Created by Mostafa Khattab on 5/26/17.
//  Copyright © 2017 Mostafa Khattab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstaImageView : UIImageView {
    UIActivityIndicatorView *activityIndicator;
    NSURLSessionDownloadTask *downloadPhotoTask;
}
-(void)setImageWithURL:(NSURL *)url;
@end

//
//  ViewController.h
//  MailMessageProfile
//
//  Created by Mac on 13/08/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *myImageView;


- (IBAction)openPhotoAlbum:(id)sender;
- (IBAction)mailAction:(id)sender;

- (IBAction)openCameraAction:(id)sender;
- (IBAction)smsAction:(id)sender;


@end


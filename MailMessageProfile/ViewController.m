//
//  ViewController.m
//  MailMessageProfile
//
//  Created by Mac on 13/08/1938 Saka.
//  Copyright © 1938 Saka Aksh. All rights reserved.
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

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"%@",info);
    
    UIImage *image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    self.myImageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



- (IBAction)openCameraAction:(id)sender {
    
    UIImagePickerController *imagePickerController =[[UIImagePickerController alloc]init];
    
    imagePickerController.delegate = self;
    
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    
}

- (IBAction)openPhotoAlbum:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    
    imagePickerController.delegate = self;
    
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

- (IBAction)mailAction:(id)sender {
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    
    mailController.mailComposeDelegate =self;
    
    [mailController setToRecipients:@[@"patilakshays1994@gmail.com"]];
     
    [mailController setSubject:@"Firebase Doc - Read"];
    
    [mailController setMessageBody:@"https://firebase.google.com/docs/database/ios/read-and-write" isHTML:NO];
    
    
    
    [self presentViewController:mailController animated:YES completion:nil];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    else{
        switch (result) {
            case MFMailComposeResultCancelled:
                NSLog(@"Mail Cancelled");
                break;
                
            case MFMailComposeResultSaved:
                NSLog(@"Mail Cancelled");
                break;
                
            case MFMailComposeResultSent:
                NSLog(@"Mail Cancelled");
                break;
                
            case MFMailComposeResultFailed:
                NSLog(@"Mail Cancelled");
                break;
            
        }
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)smsAction:(id)sender {
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc]init];
    
    messageController.delegate = self;
    
    [messageController setRecipients:@[@"+919403555251"]];
    
    [self presentViewController:messageController animated:YES completion:nil];
    
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Mail Cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Mail Sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Mail Failed");
            break;

    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end

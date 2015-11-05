//
//  ActionViewController.m
//  Read
//
//  Created by 蔡繼東 on 2015/11/5.
//  Copyright © 2015年 tungtungtsai. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@import AVFoundation;


@interface ActionViewController ()


@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the item[s] we're handling from the extension context.
    
    // For example, look for an image and place it into an image view.
    // Replace this with something appropriate for the type[s] your extension supports.
    
    NSExtensionItem *item = self.extensionContext.inputItems[0];
    NSItemProvider *itemProvider = item.attachments[0];
    
    if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypePlainText]) {

        [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypePlainText options:nil completionHandler:^(NSString* item, NSError * error) {
            if (item) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.TextView setText:item];
                    
                    //Set Synthesizer and utterence
                    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
                    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.TextView.text];
                    [utterance setRate:0.5];
                    [synthesizer speakUtterance:utterance];
                }];
            }
        }];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
}

@end

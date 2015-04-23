//
//  preview.h
//  Aliens
//
//  Created by awsuser8 on 23/04/15.
//  Copyright (c) 2015 aasare. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface preview : NSViewController

@property(nonatomic,strong) NSString *nameString;
@property (strong) IBOutlet NSTextField *printPDF;
- (IBAction)ExportPDF:(id)sender;

@end

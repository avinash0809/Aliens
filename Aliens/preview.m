//
//  preview.m
//  Aliens
//
//  Created by awsuser8 on 23/04/15.
//  Copyright (c) 2015 aasare. All rights reserved.
//

#import "preview.h"

@interface preview ()

@end

@implementation preview
@synthesize nameString;
@synthesize printPDF;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSString * previewString = [[NSUserDefaults standardUserDefaults] valueForKey:@"stringValue" ];
    nameString = [[NSUserDefaults standardUserDefaults] valueForKey:@"name"];
    NSLog(@"insertLabel is %@",previewString);
    [printPDF setStringValue:previewString];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"stringValue"];

   }

- (IBAction)ExportPDF:(id)sender {
    NSLog(@"name is %@",nameString);
    NSData *pdfData = [[NSData alloc]init];
    pdfData = [printPDF dataWithPDFInsideRect:[printPDF bounds]];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@/%@.pdf",documentsDirectory,nameString];
    [pdfData writeToFile:path atomically:YES];
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:[NSString stringWithFormat:@"File saved in documents direcoty under the name %@.pdf",nameString]];
    [alert setAlertStyle:NSWarningAlertStyle];
    [alert runModal];
    [self dismissViewController:self];
}
@end

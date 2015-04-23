//
//  ViewController.m
//  Aliens
//
//  Created by awsuser8 on 22/04/15.
//  Copyright (c) 2015 aasare. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Quartz/Quartz.h>
#import "preview.h"

@implementation ViewController

@synthesize codeName;
@synthesize bloodColor;
@synthesize noOfAntennas;
@synthesize noOfLegs;
@synthesize homePlanet;
@synthesize codeNameString;
@synthesize bloodColorString;
@synthesize noOfAntennasString;
@synthesize noOfLegsString;
@synthesize homePlanetString;
NSString* codeNameStringTrimmed;
NSString *fileContentPdf;
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)exportText:(id)sender {
    
    [self getValues];
    [self writeAsText];
    [self clearValues];
}

- (IBAction)exportPDF:(id)sender {
    
    [self getValues];
    if ([codeNameStringTrimmed isEqualToString:@""]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Dude give us the code name and then enter"];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
    }
    else {
            fileContentPdf = [NSString stringWithFormat:@"codeName=%@\nbloodColor=%@\nnoOfAntennas=%@\nnoOfLegs=%@\nhomePlanet=%@\n",codeNameString,bloodColorString,noOfAntennasString,noOfLegsString,homePlanetString];
            NSString *name = codeNameStringTrimmed;
            NSLog(@"print pdf =%@",fileContentPdf);
            [[NSUserDefaults standardUserDefaults] setValue:fileContentPdf forKey:@"stringValue"];
            [[NSUserDefaults standardUserDefaults] setValue:name forKey:@"name"];
            [[NSUserDefaults standardUserDefaults]synchronize];
                       [self clearValues];
            [self performSegueWithIdentifier:@"page2" sender:self];
    }
}

- (IBAction)moreExport:(id)sender {
}

-(void) getValues {
    codeNameString = [codeName stringValue];
    bloodColorString = [bloodColor stringValue];
    noOfAntennasString = [NSString stringWithFormat:@"%d",[noOfAntennas intValue]];
    noOfLegsString = [NSString stringWithFormat:@"%d",[noOfLegs intValue]];
    homePlanetString = [homePlanet stringValue];
    
    codeNameStringTrimmed = [codeNameString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(void) writeAsText {
    if ([codeNameStringTrimmed isEqualToString:@""]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Dude give us the code name and then enter"];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
       
    }
    else {
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *pathText = [NSString stringWithFormat:@"%@/%@.txt",documentsDirectory,codeNameStringTrimmed];
        NSURL *path = [NSURL fileURLWithPath:pathText];
        NSString *fileContent = [NSString stringWithFormat:@"codeName=%@\nbloodColor=%@\nnoOfAntennas=%@\nnoOfLegs=%@\nhomePlanet=%@\n",codeNameString,bloodColorString,noOfAntennasString,noOfLegsString,homePlanetString];
        [fileContent writeToURL:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:[NSString stringWithFormat:@"File saved in documents direcoty under the name %@.txt",codeNameStringTrimmed]];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
    }
}


-(void) clearValues {
    [codeName setStringValue:@""];
    [bloodColor setStringValue:@""];
    [noOfAntennas setStringValue:@""];
    [noOfLegs setStringValue:@""];
    [homePlanet setStringValue:@""];
   
}

-(void) prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender{
    }


@end

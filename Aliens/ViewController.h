//
//  ViewController.h
//  Aliens
//
//  Created by awsuser8 on 22/04/15.
//  Copyright (c) 2015 aasare. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSAlertDelegate>

@property (strong) IBOutlet NSTextField *codeName;
@property (strong) IBOutlet NSTextField *bloodColor;
@property (strong) IBOutlet NSTextField *noOfAntennas;
@property (strong) IBOutlet NSTextField *noOfLegs;
@property (strong) IBOutlet NSTextField *homePlanet;
- (IBAction)exportText:(id)sender;
- (IBAction)exportPDF:(id)sender;
- (IBAction)moreExport:(id)sender;

@property (strong) NSString *codeNameString;
@property (strong) NSString *bloodColorString;
@property (strong) NSString *noOfAntennasString;
@property (strong) NSString *noOfLegsString;
@property (strong) NSString *homePlanetString;

@end


//
//  ViewController.m
//  DLChildApp
//
//  Created by PK/PQ Computer on 2/27/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

// Crazy change right here...

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UIButton *reportBtn;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) NSString *childLatitude;
@property (nonatomic) NSString *childLongitude;

@property (strong, nonatomic) UILabel *errorLabel;

//- (void)addSubview:(UIView *)errorLabel;

@end

@implementation ViewController

- (IBAction)report:(id)sender {
	
		
	NSDictionary *userDetails = @{ @"username": self.userID.text, @"current_latitude": self.childLatitude, @"current_longitude": self.childLongitude };
	
	
	// use stringByAppendingString to add userID data into string object
	NSString *urlString = @"https://turntotech.firebaseio.com/digitalleash/";
	urlString = [urlString stringByAppendingString:self.userID.text];
	urlString = [urlString stringByAppendingString:@".json"];
	
	NSLog (@"The URL string is: %@", urlString);
	
	// URL of the endpoint
	NSURL *url = [NSURL URLWithString: urlString];
	
	//create JSON object from NSDictionary
	NSData *JSONData = [NSJSONSerialization dataWithJSONObject:userDetails
													   options:0														 error:nil];
	// Create a PUT request with our JSON as a request body
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = @"PATCH";
	request.HTTPBody = JSONData;
	
	// Create an NSURLSessionData task using PUT request, add completionHandler
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
																 completionHandler:^(NSData *data,
																					 NSURLResponse *response,
																					 NSError *error)
								  // check for error
								  {
									  if (!error)
									  {
										  // if no error then:
										  NSLog(@"Status code: %li", (long)((NSHTTPURLResponse *)response).statusCode);
										  
										  dispatch_async(dispatch_get_main_queue(), ^{
											  // do work here
											  [self performSegueWithIdentifier:@"SegueDone" sender:self];
										  });
										  
										  
									  }       else       {
										  NSLog(@"Error: %@", error.localizedDescription);
										  
										  UILabel *errorLabel = [[UILabel alloc] init];
										  
										   
										  
										  errorLabel.frame = CGRectMake(0,0,  self.view.frame.size.width ,50);
										  
										  errorLabel.backgroundColor = [UIColor redColor];
										  errorLabel.textColor = [UIColor whiteColor];
										  errorLabel.textAlignment = NSTextAlignmentCenter;
										  errorLabel.text = @"No internet connection";
										  
										  [self.view addSubview:errorLabel];
										  

										  
										  
									  }
								  }];
	
	// Start the task.  Remember all tasks are 'suspended' by default
	[task resume];
	
	
	
}



- (void)viewDidLoad {
	
	[super viewDidLoad];
	// call locationServicesEnabled method on CLLocationManager class
	self.reportBtn.hidden=YES;
	if ([CLLocationManager locationServicesEnabled]) {
		
		// alloc init CLLocationManager
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
		// set distanceFilter and desiredAccuracy
		self.locationManager.distanceFilter = kCLDistanceFilterNone;
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		// request "when in use" authorization
		// remember to add string to plist!
		[self.locationManager requestWhenInUseAuthorization];
		// call startUpdatingLocation method
		[self.locationManager startUpdatingLocation];
	} else {
		NSLog (@"Location services are not enabled");
	}
}

- (void) locationManager: (CLLocationManager *) manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
	CLLocation *location = [locations lastObject];
	
	// assign to childLatitude and childLongitude variables
	self.childLatitude = [NSString stringWithFormat:@"%.2f", location.coordinate.latitude];
	self.childLongitude = [NSString stringWithFormat:@"%.2f", location.coordinate.longitude];
	self.reportBtn.hidden=NO;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end

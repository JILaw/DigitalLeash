//
//  ViewController.m
//  DLParentApp
//
//  Created by PK/PQ Computer on 2/26/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *radius;
@property (weak, nonatomic) IBOutlet UITextField *myLongitude;
@property (weak, nonatomic) IBOutlet UITextField *myLatitude;





@end

@implementation ViewController

- (IBAction)create:(id)sender {
	
	NSDictionary *userDetails = @{ @"username": self.userID.text, @"latitude": self.myLatitude.text, @"longitude": self.myLongitude.text, @"radius": self.radius.text };
	
	
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
	request.HTTPMethod = @"PUT";
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
  
	  NSLog(@"Status code: %li", (long)((NSHTTPURLResponse *)response).statusCode);
  }       else       {
	  
	  dispatch_async(dispatch_get_main_queue(), ^{
		  // do work here
		  UILabel *errorLabel = [[UILabel alloc] init];
		  
		  errorLabel.frame = CGRectMake(0,0,500,50);
		  
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

- (IBAction)update:(id)sender {
	NSDictionary *userDetails = @{@"latitude": self.myLatitude.text, @"longitude": self.myLongitude.text, @"radius": self.radius.text };
	
	
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
										  NSLog(@"Status code: %li", (long)((NSHTTPURLResponse *)response).statusCode);
									  }       else       {
										  
										  dispatch_async(dispatch_get_main_queue(), ^{
											  // do work here
											  UILabel *errorLabel = [[UILabel alloc] init];
											  
											  errorLabel.frame = CGRectMake(0,0,500,50);
											  
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

- (IBAction)status:(id)sender {
	NSDictionary *userDetails = @{ @"username": self.userID.text, @"latitude": self.myLatitude.text, @"longitude": self.myLongitude.text, @"radius": self.radius.text };
	
	
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
	// Create a GET request that returns JSON as a request body
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = @"GET";
	request.HTTPBody = JSONData;
	
	// Create an NSURLSessionData task using GET request, add completionHandler
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
																 completionHandler:^(NSData *data,
																					 NSURLResponse *response,
																					 NSError *error)
								  // check for error
								  {
									  if (!error)
									  {	  NSLog(@"Status code: %li", (long)((NSHTTPURLResponse *)response).statusCode);
									  }       else       {
										  
										  dispatch_async(dispatch_get_main_queue(), ^{
											  // do work here
											  UILabel *errorLabel = [[UILabel alloc] init];
											  
											  errorLabel.frame = CGRectMake(0,0,500,50);
											  
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
								  
	  // code here to convert JSONData to NSDictionary
									  
	  
	  NSDictionary *fromJSON = [NSJSONSerialization JSONObjectWithData: data options:0 error: nil];
	  
									  
	  // log the  NSDictionary json to the console
	  NSLog(@"%@", fromJSON);
									  
	  CLLocationDegrees parentLat = [[fromJSON objectForKey: @"latitude"] doubleValue];
	  CLLocationDegrees parentLon = [[fromJSON objectForKey: @"longitude"] doubleValue];
									  
	  CLLocationDegrees childLat = [[fromJSON objectForKey: @"current_latitude"] doubleValue];
	  CLLocationDegrees childLon = [[fromJSON objectForKey: @"current_longitude"] doubleValue];
									  
	  // if childLat || childLon = nil {
	  //
	 
									  
	  CLLocation *parentLoc = [[CLLocation alloc]initWithLatitude: parentLat longitude:parentLon];
	  CLLocation *childLoc = [[CLLocation alloc]initWithLatitude: childLat longitude: childLon];
									  
	  CLLocationDistance distanceBetweenParentAndChild = [childLoc distanceFromLocation:parentLoc];
	  NSLog (@"Distance between parent and child is:%f", distanceBetweenParentAndChild);
									  
	  
									  
    double rad = [[userDetails objectForKey: @"radius"] doubleValue];
	  
	if ((distanceBetweenParentAndChild) > rad) {
		
		dispatch_async(dispatch_get_main_queue(), ^{
			// do work here
			[self performSegueWithIdentifier:@"SegueToChildFineVC" sender:self];
		});
		
	
		
		
	} else {
		dispatch_async(dispatch_get_main_queue(), ^{
			// do work here
			[self performSegueWithIdentifier:@"SegueToChildOutRangeVC" sender:self];
		});
	

									  
	}
	 
    }];
	
	// Start the task.  Remember all tasks are 'suspended' by default
	[task resume];
	
}






- (void)viewDidLoad {
	[super viewDidLoad];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}



@end

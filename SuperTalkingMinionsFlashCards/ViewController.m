//
//  ViewController.m
//  SuperTalkingMinionsFlashCards
//
//  Created by Mubshir Raza Ali on 27/07/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "ViewController.h"
#import "TouchSimpleView.h"


@interface ViewController ()

@end

@implementation ViewController


bool slocked;
AVAudioPlayer *audioPlayer;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
     [self loadDef];   
    
     [self loadAds];
}

- (IBAction)ImageClickedEvent:(id)sender {
    
    [self loadScene];

}

- (IBAction)ImageSwipedEvent:(id)sender {
    [self loadScene];

}

- (IBAction)ImageLongPressEvent:(id)sender {
    [self loadScene];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadScene{
    [self loadImage];
    [self loadSound];
}

-(void)loadImage{
    
    int number = (arc4random()%35)+1; //Generates Number from 1 to 100.
    NSString *string = [NSString stringWithFormat:@"%i", number];
    NSString *imgFileName=[NSString stringWithFormat:@"%@%@%@",@"m", string,@".jpg"];
    imgView.image = [UIImage imageNamed:imgFileName];
    
}

-(void)loadSound{

    int snumber = (arc4random()%15)+1; //Generates Number from 1 to 100.
    NSString *sstring = [NSString stringWithFormat:@"%i", snumber];
    NSString *simgFileName=[NSString stringWithFormat:@"%@%@%@",@"%@/m", sstring,@".mp3"];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:simgFileName, [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (audioPlayer == nil)
		NSLog([error description]);
	else
		[audioPlayer play];
    
}

-(void)loadDef{

    
        
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/m6.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (audioPlayer == nil)
		NSLog([error description]);
	else
		[audioPlayer play];
}

- (void)dealloc {
	//[audioPlayer release];
	//[super dealloc];
}

-(void) loadAds{
    
    
   

    // Do any additional setup after loading the view from its nib.
    
       
    //YouTube
    
    
    // Create a view of the standard size at the bottom of the screen.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    //Rotation of the AdMob Banner, change 0.0f for example to 0.5f
    //  CGAffineTransform makeLandscape = CGAffineTransformMakeRotation(M_PI * 0.0f);
    
    //and Position of the Banner, the values depends to the values of the CGRectMake of the bannerView_ object
    //  makeLandscape = CGAffineTransformTranslate(makeLandscape, 0, -400);
    //    bannerView_.transform = makeLandscape;
    
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    bannerView_.adUnitID = @"a151f5640553bbc";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
   
    //[self.view addSubview:adView];
    
    
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // test devivce
	GADRequest *request = [GADRequest request];
	
	//request.testDevices = [NSArray arrayWithObjects: GAD_SIMULATOR_ID, nil];
	
   // [self.view addSubview:self.adBanner];
    
    // Constraint keeps ad at the bottom of the screen at all times.
  
    
    
	// Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:request];

}

@end


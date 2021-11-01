#import "Macros.h"
#import "NSTask.h"
#import "logo.h"
#import "Obfuscate.h"
// Originally created by Ted2
// Significantly modified by EmptiedSoul

void setup() {
  // Init first tab
  UIScrollView* firstSection = [menu getScrollView];
  UIButton* firstSectionButton = [menu addSectionButton:firstSection text:@"Govno"];
  // Init second tab
  UIScrollView* secondSection = [menu getScrollView];
  UIButton* secondSectionButton = [menu addSectionButton:secondSection text:@"Mocha"];
  // Init third tab
  UIScrollView* thirdSection = [menu getScrollView];
  UIButton* thirdSectionButton = [menu addSectionButton:thirdSection text:@"Pustota"];
  
  // Activate first tab
  [menu activateScrollView:firstSectionButton];

  // Add switches to the active tab (1st)

  // Use ENCRYPT, NSSENCRYPT, ENCRYPTOFFSET and ENCRYPTBYTES in switches and all strings!
  // Dont be like me here
  [switches addSwitch:@"Mama Gleba"
              description:@"Teleport all enemies to you without them knowing"
	];
  [switches addSwitch:@"Gay Mode"
              description:@"You can't die"
	];
  [switches addOffsetSwitch:@"Gay Mod"
              description:@"You can't die"
	      	offsets:{0x1001BB2C0}
		  bytes:{"0x00E0BF12C0035FD6"}
	];
 
  [switches addSwitch:@"Gay Mo"
              description:@"You can't die"
	];
 
  [switches addSwitch:@"Gay M"
              description:@"You can't die"
	];
 
  [switches addSwitch:@"Gay"
              description:@"You can't die"
	];
 
  // Activate second tab
  [menu activateScrollView:secondSectionButton];

  // Add switches to the active tab (2nd)
  [switches addSwitch:@"One sHit Kill"
              description:@"Enemy will die instantly"
	];
  [switches addSwitch:@"One sHit Kil"
              description:@"Enemy will die instantly"
	];

  [switches addSwitch:@"One sHit Ki"
              description:@"Enemy will die instantly"
	];

  [switches addSwitch:@"One sHit K"
              description:@"Enemy will die instantly"
	];

  [switches addSwitch:@"One sHit"
              description:@"Enemy will die instantly"
	];


  [switches addTextfieldSwitch:@"Custom Anus"
              description:@"Here you can enter your own gold amount"
                inputBorderColor:UIColorFromHex(0xBD0000)];
  [switches addSliderSwitch:@"Custom wank Speed"
              description:@"Set your custom move speed"
                minimumValue:0
                  maximumValue:10
                    sliderColor:UIColorFromHex(0xBD0000)];
  [switches addSwitch:NSHomeDirectory()
              description:@"You can't die"
	      ];

  // Activate third tab, user will see this tab activated by default 
  [menu activateScrollView:thirdSectionButton];

}


/**********************************************************************************************************
     You can customize the menu here
     For colors, you can use hex color codes or UIColor itself
      - For the hex color #BD0000 you'd use: UIColorFromHex(0xBD0000)
      - For UIColor you can visit this site: https://www.uicolor.xyz/#/rgb-to-ui
        NOTE: remove the ";" when you copy your UIColor from there!
     
     Site to find your perfect font for the menu: http://iosfonts.com/  --> view on mac or ios device
     See comment next to maxVisibleSwitches!!!!

     If you want to change LOGO -> put needed image at logo.png
     To represent base64 logo use 'LOGO' macros

     Defined macros:
     	- HACK	    -> HACK="..." in your config.mk (e.g. HarDClanZTopHack)
     	- HOMEPAGE  -> HOMEPAGE="..." in your config.mk (e.g. hardclanz.org)
	- VERSION   -> VERSION="..." in your config.mk (e.g. 1.0)
	- GAME_ID   -> GAME_ID="..." in your config.mk (e.g. com.axlebolt.standoff2) (Its dumped in .plist when you build your hack)
	- DEV_ID    -> DEV_ID="..." in your config.mk (its your developer ID assigned by hardclanz.org if you are using our authorisation)
	- DEVELOPER -> DEVELOPER="..." in your config.mk (e.g. Emptied Soul)
     	- LOGO      -> NSString containing base64 representation of your logo. Its generated automatically from logo.png
     IF YOU WANT TO CHANGE THOSE VALUES, EDIT CONFIG.MK, NOT CODE!
************************************************************************************************************/
void setupMenu() {

  // If a game uses a framework as base executable, you can enter the name here.
  // For example: UnityFramework, in that case you have to replace NULL with "UnityFramework" (note the quotes)
  [menu setFrameworkName:NULL];

  menu = [[Menu alloc]  // Initialize menu
            initWithTitle:NSSENCRYPT("HarDClanZ Test Menu")			// Title
            titleColor:[UIColor whiteColor]					// Title text color
            titleFont:@"AmericanTypewriter-Bold"				// Title font
	    status:NSSENCRYPT(HOMEPAGE)						// Footer text line (in this case it expands into status:@"hardclanz.org" or any site you want)
	    statusColor:[UIColor redColor]					// Footer text line color
	    statusFont:@"AmericanTypewriter-Bold"				// Footer text line font
            credits:NSSENCRYPT(DESCRIPTION)					// This line displayed when you push icon within menu 
            headerColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]		// Menu color
            switchOffColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]    // Switch color (when disabled)
            switchOnColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]	// Switch color (when enabled)
            switchTitleFont:@"Courier-Bold"					// Swtich text font
            switchTitleColor:[UIColor whiteColor]				// Switch text color
            infoButtonColor:UIColorFromHex(0x60ff06)				// (i) button color
            maxVisibleSwitches:6						// Less than max -> blank space, more than max -> you can scroll!
            menuWidth:315							// Menu width
            menuIcon:@""							// Menu icon (within menu), if blank, equals to menuButton
	    menuButton:LOGO							// Base64 image for Menu Button
	    isHidden:true							// if 'false' -> button is visible. if 'true' -> button is invisible and fixed at screen centre
	    isActivatedByGesture:true						// if 'false' -> menu shows up on button push. if 'true' -> menu shows up after specific gesture
	    numberOfTapsRequired: 3						// Works only if previous switch is flipped on. Number of Taps Required to show menu
	    numberOfTouchesRequired: 3						// Works only if previous switch if flippen on. Number of Fingers used in gesture Required to show menu
];
  setup(); // After initializing menu, lets fill it up with switches
}

// If the menu button doesn't show up; Change the timer to a bigger amount.
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
	timer(3) {
		setupMenu(); // Wait 3 seconds after game is started and start up our hack	
	});
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

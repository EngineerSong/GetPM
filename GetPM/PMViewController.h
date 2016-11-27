//
//  PMViewController.h
//  GetPM
//
//  Created by barara on 15/12/29.
//  Copyright © 2015年 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface PMViewController : UIViewController <CBCentralManagerDelegate,CBPeripheralDelegate,UITextViewDelegate>

@property (nonatomic, strong) CBCentralManager *cbCentralMgr;
@property (nonatomic, strong) CBPeripheral *getPeripheral;

@end

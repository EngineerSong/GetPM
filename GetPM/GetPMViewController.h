//
//  GetPMViewController.h
//  GetPM
//
//  Created by barara on 15/12/29.
//  Copyright © 2015年 Jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface GetPMViewController : UIViewController <CBCentralManagerDelegate,CBPeripheralDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (nonatomic, strong) CBCentralManager *cbCentralMgr;
@property (nonatomic, strong) NSMutableArray *peripheraArray;
@property (nonatomic, strong) NSDictionary *dic;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *perArray;

@property (nonatomic, strong) UITableView *tableView;

@end

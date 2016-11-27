//
//  GetPMViewController.m
//  GetPM
//
//  Created by barara on 15/12/29.
//  Copyright © 2015年 Jay. All rights reserved.
//

#import "GetPMViewController.h"
#import "BluetoothModel.h"
#import "BluetoothCell.h"
#import "PMViewController.h"

#define characteristicUUID  @"FFF6"

@interface GetPMViewController ()

{
    NSMutableString *_getUUID;
    CBPeripheral *_getPeripheral;
    CBCharacteristic *_character;
    CBPeripheral* _peripheral;
    UITextView *_textView;
    
    int _isExist;
    int _isback;
}

@end

@implementation GetPMViewController

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"************页面出现************");
    
    if (_getPeripheral) {
        
        NSLog(@"断开连接");
        
        _cbCentralMgr.delegate = self;
        
        [_cbCentralMgr cancelPeripheralConnection:_getPeripheral];
        
        //_getPeripheral = nil;
        [_perArray removeAllObjects];
        
        [self.tableView reloadData];
        
        [self.cbCentralMgr scanForPeripheralsWithServices:nil options:_dic];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"List";
    self.navigationController.navigationBar.translucent = NO;
    
    //创建一个中央
    self.cbCentralMgr = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    self.cbCentralMgr.delegate = self;
    //self.peripheraArray = [NSMutableArray array];
    
    //_dataArray = [NSMutableArray array];
    _perArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100-60)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 80;
    [self.view addSubview:_tableView];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40-64, self.view.frame.size.width, 40)];
    _textView.font = [UIFont fontWithName:@"Arial" size:18.0];
    _textView.backgroundColor = [UIColor blackColor];
    _textView.textColor = [UIColor whiteColor];
    _textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _textView.scrollEnabled = YES;
    //_textView.selectable = YES;//选择复制功能
    //_textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    _textView.delegate = self;
    _textView.editable = NO;//禁止编辑
    [self.view addSubview:_textView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _perArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BluetoothCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BluetoothCell" owner:self options:nil] lastObject];
    }
    
    BluetoothModel *bm = self.perArray[indexPath.row];
    cell.nameLabel.text = bm.name;
    cell.UUIDLabel.text = bm.UUID;
    cell.RSSILabel.text = [NSString stringWithFormat:@"%@",bm.RSSI];
    
    return cell;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if (central.state != CBCentralManagerStatePoweredOn) {
        NSLog(@"蓝牙未打开");
        return;
    }
    //开始寻找所有的服务
    _dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false],CBCentralManagerScanOptionAllowDuplicatesKey, nil];
    
    [self.cbCentralMgr scanForPeripheralsWithServices:nil options:_dic];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [_cbCentralMgr stopScan];
    BluetoothModel *bm = _perArray[indexPath.row];
    _getUUID = [[NSMutableString alloc] initWithString:bm.UUID];
    _getPeripheral = bm.peripheral;
    NSLog(@"per = %@",_getPeripheral);
    
    PMViewController *pmc = [[PMViewController alloc] init];
    pmc.cbCentralMgr = _cbCentralMgr;
    pmc.getPeripheral = _getPeripheral;
    pmc.title = @"PM2.5 Sensor";
    
    [self.navigationController pushViewController:pmc animated:YES];
}

//扫描到周边设备
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    if (_peripheral != peripheral) {
        _peripheral = peripheral;
    }
    
    NSString *UUID = [peripheral.identifier UUIDString];
    //NSString *UUID1 = CFBridgingRelease(CFUUIDCreateString(NULL, _peripheral.UUID));
    NSLog(@"name:%@,UUID: %@,RSSI:%@",_peripheral.name,UUID,RSSI);
    
    BluetoothModel *bm = [[BluetoothModel alloc] init];
    bm.peripheral = _peripheral;
    bm.name = _peripheral.name;
    bm.UUID = UUID;
    bm.RSSI = RSSI;
    if (_perArray.count == 0) {
        [_perArray addObject:bm];
    }else{
        for (BluetoothModel *bm in _perArray) {
            if ([bm.UUID isEqualToString:UUID]) {
                bm.RSSI = RSSI;
                _isExist = 1;
            }
        }
        if (_isExist == 0) {
            [_perArray addObject:bm];
        }
        _isExist = 0;
    }
    
    NSLog(@"perArray = %@",_perArray);
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

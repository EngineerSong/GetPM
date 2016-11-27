//
//  PMViewController.m
//  GetPM
//
//  Created by barara on 15/12/29.
//  Copyright © 2015年 Jay. All rights reserved.
//

#import "PMViewController.h"

#define characteristicUUID  @"FFF6"
#define GETHEIGHT  self.view.frame.size.height
#define GETWIDTH  self.view.frame.size.width

@interface PMViewController ()

{
    UITextView *_textView;
    Byte _dataArr[32];
    UILabel *_label1;
    UILabel *_label2;
    UILabel *_label3;
    UILabel *_label4;
    UILabel *_label5;
    UILabel *_label6;
    UILabel *_label7;
    UILabel *_label8;
    UILabel *_label9;
    UILabel *_label10;
    UILabel *_label11;
    UILabel *_label12;
}

@end

@implementation PMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"1.png"];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    self.view.layer.contents = (id)image.CGImage;
    
    UILabel *firstLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, GETWIDTH-90, 30)];
    UILabel *firstLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30, GETWIDTH-90, 30)];
    UILabel *firstLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*2, GETWIDTH-90, 30)];
    UILabel *firstLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*3, GETWIDTH-90, 30)];
    UILabel *firstLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*4, GETWIDTH-90, 30)];
    UILabel *firstLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*5, GETWIDTH-90, 30)];
    UILabel *firstLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*6, GETWIDTH-90, 30)];
    UILabel *firstLabel8 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*7, GETWIDTH-90, 30)];
    UILabel *firstLabel9 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*8, GETWIDTH-90, 30)];
    UILabel *firstLabel10 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*9, GETWIDTH-90, 30)];
    UILabel *firstLabel11 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*10, GETWIDTH-90, 30)];
    UILabel *firstLabel12 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+30*11, GETWIDTH-90, 30)];
    
    firstLabel1.text = @"PM1.0浓度(CF=1,标准颗粒物):";
    firstLabel2.text = @"PM2.5浓度(CF=1,标准颗粒物):";
    firstLabel3.text = @"PM10 浓度(CF=1,标准颗粒物):";
    firstLabel1.textColor = [UIColor yellowColor];
    firstLabel2.textColor = [UIColor yellowColor];
    firstLabel3.textColor = [UIColor yellowColor];
    
    firstLabel4.text = @"PM1.0 浓度(大气环境下):";
    firstLabel5.text = @"PM2.5 浓度(大气环境下):";
    firstLabel6.text = @"PM10  浓度(大气环境下):";
    firstLabel4.textColor = [UIColor magentaColor];
    firstLabel5.textColor = [UIColor magentaColor];
    firstLabel6.textColor = [UIColor magentaColor];
    
    firstLabel1.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    firstLabel2.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    firstLabel3.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    firstLabel4.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    firstLabel5.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    firstLabel6.font = [UIFont fontWithName:@"Arial-Bold" size:18];
    
    firstLabel7.text = @"0.1升空气中直径在0.3um以上颗粒物个数:";
    firstLabel8.text = @"0.1升空气中直径在0.5um以上颗粒物个数:";
    firstLabel9.text = @"0.1升空气中直径在1.0um以上颗粒物个数:";
    firstLabel10.text = @"0.1升空气中直径在2.5um以上颗粒物个数:";
    firstLabel11.text = @"0.1升空气中直径在5.0um以上颗粒物个数:";
    firstLabel12.text = @"0.1升空气中直径在10 um以上颗粒物个数:";
    //label.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:24];
    firstLabel7.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel8.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel9.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel10.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel11.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel12.font = [UIFont fontWithName:@"Arial" size:12];
    firstLabel7.textColor = [UIColor purpleColor];
    firstLabel8.textColor = [UIColor purpleColor];
    firstLabel9.textColor = [UIColor purpleColor];
    firstLabel10.textColor = [UIColor purpleColor];
    firstLabel11.textColor = [UIColor purpleColor];
    firstLabel12.textColor = [UIColor purpleColor];
    
    [self.view addSubview:firstLabel1];
    [self.view addSubview:firstLabel2];
    [self.view addSubview:firstLabel3];
    [self.view addSubview:firstLabel4];
    [self.view addSubview:firstLabel5];
    [self.view addSubview:firstLabel6];
    [self.view addSubview:firstLabel7];
    [self.view addSubview:firstLabel8];
    [self.view addSubview:firstLabel9];
    [self.view addSubview:firstLabel10];
    [self.view addSubview:firstLabel11];
    [self.view addSubview:firstLabel12];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10, 75, 30)];
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*1, 75, 30)];
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*2, 75, 30)];
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*3, 75, 30)];
    _label5 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*4, 75, 30)];
    _label6 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*5, 75, 30)];
    _label7 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*6, 75, 30)];
    _label8 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*7, 75, 30)];
    _label9 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*8, 75, 30)];
    _label10 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*9, 75, 30)];
    _label11 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*10, 75, 30)];
    _label12 = [[UILabel alloc] initWithFrame:CGRectMake(GETWIDTH-75, 10+30*11, 75, 30)];
    
    _label1.textColor = [UIColor yellowColor];
    _label2.textColor = [UIColor yellowColor];
    _label3.textColor = [UIColor yellowColor];
    _label4.textColor = [UIColor magentaColor];
    _label5.textColor = [UIColor magentaColor];
    _label6.textColor = [UIColor magentaColor];
    _label7.textColor = [UIColor purpleColor];
    _label8.textColor = [UIColor purpleColor];
    _label9.textColor = [UIColor purpleColor];
    _label10.textColor = [UIColor purpleColor];
    _label11.textColor = [UIColor purpleColor];
    _label12.textColor = [UIColor purpleColor];
    
    _label1.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label2.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label3.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label4.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label5.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label6.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label7.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label8.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label9.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label10.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label11.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    _label12.font = [UIFont fontWithName:@"Arial-Bold" size:18.0];
    
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    [self.view addSubview:_label3];
    [self.view addSubview:_label4];
    [self.view addSubview:_label5];
    [self.view addSubview:_label6];
    [self.view addSubview:_label7];
    [self.view addSubview:_label8];
    [self.view addSubview:_label9];
    [self.view addSubview:_label10];
    [self.view addSubview:_label11];
    [self.view addSubview:_label12];
    
    _cbCentralMgr.delegate = self;
    
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
    
    //开始连接周边
    [_cbCentralMgr connectPeripheral:_getPeripheral options:nil];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    
}

//连接周边成功
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    _getPeripheral.delegate = self;
    //连接周边服务
    
    NSLog(@"连接周边成功");
    
    _textView.text = @"连接周边成功\n";
    if (_textView.text.length > 100) {
        _textView.text = @"";
    }
    
    [_getPeripheral discoverServices:nil];
    
}

//连接周边失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"连接失败");
    
    _textView.text = @"连接周边失败\n";
    if (_textView.text.length > 100) {
        _textView.text = @"";
    }
    
}

//连接周边服务
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    if (error) {
        NSLog(@"错误的服务");
        
        _textView.text = @"服务错误\n";
        if (_textView.text.length > 100) {
            _textView.text = @"";
        }
        
        return;
    }
    
    //遍历服务
    for (CBService* service in peripheral.services) {
        NSLog(@"遍历中：serviceUUID为%@",service.UUID);
        //if ([service.UUID isEqual:[CBUUID UUIDWithString:serviceUUID]]) {
        
        _textView.text = @"找到服务\n";
        if (_textView.text.length > 100) {
            _textView.text = @"";
        }
        
        //连接特征
        //[peripheral discoverCharacteristics:@[[CBUUID UUIDWithString:kCharacteristicUUID]] forService:service];
        
        [peripheral discoverCharacteristics:nil forService:service];
        
        //}
        //[service.peripheral discoverCharacteristics:nil forService:service];
        
    }
    
}

//发现特征
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    if (error) {
        NSLog(@"连接特征失败");
        
        _textView.text = @"连接特征失败\n";
        if (_textView.text.length > 100) {
            _textView.text = @"";
        }
        
        return;
    }
    
    //遍历特征
    for (CBCharacteristic* characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:characteristicUUID]]) {
            _textView.text = @"找到特征\n";
            if (_textView.text.length > 100) {
                _textView.text = @"";
            }
            //开始监听特征
            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
        }
    }
}

//监听到特征值更新
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if (error) {
        NSLog(@"特征值出错");
        return;
    }
    
    //如果有新值，读取新的值
    if (characteristic.isNotifying) {
        [peripheral readValueForCharacteristic:characteristic];
    }
}

//收到新值
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    _textView.text = @"解析数据\n";
    if (_textView.text.length > 100) {
        _textView.text = @"";
    }
    
    Byte *testByte = (Byte *)[characteristic.value bytes];
    
    NSMutableString *muStr = [[NSMutableString alloc] init];
    
    for (int i = 0; i < [characteristic.value length]; i++) {
        
        NSString *str = [NSString stringWithFormat:@" %x",testByte[i]&0xff];
        
        [muStr appendString:str];
        
    }
    
    NSLog(@"str = %@",muStr);
    
    if (testByte && testByte[0] == 0x42 && testByte[1] == 0x4D && [characteristic.value length] == 20) {
        NSLog(@"head");
        for (int i = 0; i < [characteristic.value length]; i++) {
            _dataArr[i] = testByte[i];
        }
    }else if(testByte && !(testByte[0] == 0x42 && testByte[1] == 0x4D) && (_dataArr[0] == 0x42 &&_dataArr[1] == 0x4D) && [characteristic.value length] == 12){
        for (int i = 0; i < [characteristic.value length]; i++) {
            _dataArr[20+i] = testByte[i];
        }
        
        NSMutableString *getStr = [[NSMutableString alloc] init];
        for (int i = 0; i < 32; i++) {
            NSString *str = [NSString stringWithFormat:@" %x",_dataArr[i]&0xff];
            [getStr appendString:str];
        }
        NSLog(@"getStr = %@",getStr);
        
        _label1.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[4] and:_dataArr[5]]];
        _label2.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[6] and:_dataArr[7]]];
        _label3.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[8] and:_dataArr[9]]];
        _label4.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[10] and:_dataArr[11]]];
        _label5.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[12] and:_dataArr[13]]];
        _label6.text = [NSString stringWithFormat:@"%@ug/m3",[self getNumFrom:_dataArr[14] and:_dataArr[15]]];
        _label7.text = [self getNumFrom:_dataArr[16] and:_dataArr[17]];
        _label8.text = [self getNumFrom:_dataArr[18] and:_dataArr[19]];
        _label9.text = [self getNumFrom:_dataArr[20] and:_dataArr[21]];
        _label10.text = [self getNumFrom:_dataArr[22] and:_dataArr[23]];
        _label11.text = [self getNumFrom:_dataArr[24] and:_dataArr[25]];
        _label12.text = [self getNumFrom:_dataArr[26] and:_dataArr[27]];
        
        _dataArr[0] = 0x00;
        _dataArr[1] = 0x00;
    }else{
        NSLog(@"未知格式");
    }
}

//将两个字节的16进制数转为10进制数后转换为字符串
- (NSString *)getNumFrom:(Byte)arr1 and:(Byte)arr2
{
    NSString *str1 = [NSString stringWithFormat:@"%d",arr1&0xff];
    NSString *str2 = [NSString stringWithFormat:@"%d",arr2&0xff];
    
    long a = [str1 intValue]*256;
    long b = [str2 intValue];
    long c = a+b;
    
    NSString *str = [NSString stringWithFormat:@"%ld",c];
    
    return str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

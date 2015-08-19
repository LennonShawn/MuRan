//
//  PwdVC.m
//  MVNO
//
//  Created by beautyx on 15-3-27.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "PwdVC.h"
#import "MyNoCopyTextField.h"

#define kPwdBtnTag                          33
#define kUserNameTextFieldTag				11
#define kPassWordTextFieldTag				12
#define USERNAMETEXTHEIGHT                  47


@interface PwdVC ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,ASIHTTPRequestDelegate>{

    UITableView         *pwdView;
    MyNoCopyTextField * orginPassWordTextField;
    MyNoCopyTextField * passWordTextField;
    MyNoCopyTextField * passWordRepeatTextField;

}

@end

@implementation PwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"修改初始密码";
    [self setNavTitle:self.title];
    
    [self buildView];
}

-(void)buildView{


    CGFloat loginPadStartY ;
    if (IS_IPHONE_5) {
        loginPadStartY = 18;
    } else {
        loginPadStartY = 2;
    }
    
    [self creatPwdTableView];
    [self creatPwdBtn];


}

-(void)creatPwdTableView{
    
    pwdView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, UISCREEN_WIDTH, 220) style:UITableViewStylePlain];
    pwdView.backgroundColor = [UIColor clearColor];
    pwdView.delegate = self;
    pwdView.dataSource = self;
    pwdView.scrollEnabled = NO;
    pwdView.separatorStyle = UITableViewCellSeparatorStyleNone;
    pwdView.backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT)];
    [self.view addSubview:pwdView];
    
    UILabel *tipLable = [Tools createLabel: NSLocalizedString(@"您使用的是初始密码进行登录，为保证安全，请修改服务密码！", nil) frame:CGRectMake(0, 240, UISCREEN_WIDTH, 30) color:RGBCOLOR(11, 138, 241) font:[UIFont systemFontOfSize:11] aliment:NSTextAlignmentCenter];
    [self.view addSubview:tipLable];
    
}

//修改密码按钮
-(void)creatPwdBtn{
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(10,280,UISCREEN_WIDTH- 2*10,45);
    nextButton.showsTouchWhenHighlighted = YES;
    nextButton.tag = kPwdBtnTag;
    
    [nextButton setTitle:@"确定" forState:UIControlStateNormal];
    nextButton.userInteractionEnabled = YES;
    nextButton.titleLabel.font = [UIFont systemFontOfSize:18];
    nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    nextButton.backgroundColor = [UIColor redColor];
    nextButton.titleLabel.textColor = [UIColor whiteColor];
    [nextButton addTarget:self action:@selector(pwdBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextButton];
    
}


// 服务密码登录操作
-(void)pwdBtnAction:(UIButton*)sender{
    
    UIButton* tempAction = (UIButton *)sender;
    
    [passWordTextField resignFirstResponder];
    [passWordRepeatTextField resignFirstResponder];
    if (kPwdBtnTag == tempAction.tag) {//login
        
        //校验用户名和密码
        if (0 == [orginPassWordTextField.text length]){
            [MyAlertView showSimpleAlertView:@"原始密码不能为空"];
        }
        /*
         else if(![orginPassWordTextField.text isEqualToString:[[MVNOUser currentUser] getPwd]]){
         [MyAlertView showSimpleAlertView:@"原始密码错误"];
         }
         */
        else if(0 == [passWordTextField.text length]){
            [MyAlertView showSimpleAlertView:@"新密码不能为空"];
        } else if(0 == [passWordRepeatTextField.text length]){
            [MyAlertView showSimpleAlertView:@"重复新密码不能为空"];
        } else if([orginPassWordTextField.text isEqualToString:passWordTextField.text]){
            [MyAlertView showSimpleAlertView:@"原始密码和新密码不能重复"];
        }else if(passWordTextField.text.length != 6){
            [MyAlertView showSimpleAlertView:@"新密码必须是六位数字"];
        }
        else if(![passWordRepeatTextField.text isEqualToString:passWordTextField.text]){
            [MyAlertView showSimpleAlertView:@"新密码和重复新密码两次输入不一致"];
        } else{//调用业务适配层的接口
            [self modifyPwdAction];
        }
    }
}

-(void)modifyPwdAction{
    
    if(![Tools checkNetworkIsValid]){
        
        [Tools showPrompt:@"当前没有可用网络" inView:self.view delay:1];
        return;
    }
    NSString * mappUrl = [NSString stringWithFormat:@"%@/%@",MAPP_SERVER_ADDRESS,@"password/upPassword" ];
    NSURL * url = [NSURL URLWithString:mappUrl];
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:url];
    NSString * encryOrign = [Tools TripleDES:orginPassWordTextField.text encryptOrDecrypt:kCCEncrypt];
    NSString * encryNewPwd = [Tools TripleDES:passWordRepeatTextField.text encryptOrDecrypt:kCCEncrypt];

    NSString * userName = [[MVNOUser currentUser] getUserName];
    NSString * userCode = [Tools TripleDES:userName encryptOrDecrypt:kCCEncrypt];
    [request addPostValue:userCode forKey:@"userCode"];
    [request addPostValue:encryOrign forKey:@"oldPassword"];
    [request addPostValue:encryNewPwd forKey:@"newPassword"];
    request.tag = 1;
    [request setDelegate:self];
    [request startAsynchronous];
}

#pragma mark -
#pragma mark UITableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return USERNAMETEXTHEIGHT;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [UIColor clearColor];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellWithIdentifier = @"loginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone; // 设置不能点击
    }
    
    
    CGFloat leftX = 10.0f;
    
    UITextField * textField = nil;
    if (0 == indexPath.row ) {
        
        orginPassWordTextField = [[MyNoCopyTextField alloc] initWithFrame:CGRectMake(leftX, 7, UISCREEN_WIDTH-leftX * 2, 40)];
        textField = orginPassWordTextField;
        orginPassWordTextField.placeholder = @"请输入老密码";
        orginPassWordTextField.tag = kPassWordTextFieldTag;

        [orginPassWordTextField becomeFirstResponder];

    }
    else if(1 == indexPath.row )
    {
        
        passWordTextField = [[MyNoCopyTextField alloc] initWithFrame:CGRectMake(leftX, 7, UISCREEN_WIDTH-leftX * 2, 40)];
        textField = passWordTextField;
        passWordTextField.placeholder = @"请输入新密码";
        passWordTextField.tag = kPassWordTextFieldTag;
        
        
    }
    else if(2 == indexPath.row ){
        
        passWordRepeatTextField = [[MyNoCopyTextField alloc] initWithFrame:CGRectMake(leftX, 7, UISCREEN_WIDTH-leftX * 2, 40)];
        textField = passWordRepeatTextField;
        passWordRepeatTextField.placeholder = @"请重新输入新密码";
        passWordRepeatTextField.tag = kPassWordTextFieldTag;

        
    }
    
    textField.secureTextEntry = YES;
    [textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.delegate = self;
    textField.clearButtonMode = YES;
    textField.font = [UIFont systemFontOfSize:16];
    textField.returnKeyType = UIReturnKeyDone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [cell.contentView addSubview:textField];
    
    return cell;
    
}

#pragma mark -
#pragma mark textField Delegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // the user pressed the "Done" button, so dismiss the keyboard
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

#pragma mark - ASI delegate

- (void)requestStarted:(ASIHTTPRequest *)request{
    NSLog(@"%@",@"requestStarted");
    if (request.tag == 1 ) {
        [Tools showSpinnerInView:self.view prompt:@"正在修改中"];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"%@",request.error);
    
    if (request.tag == 1 ) {
        [Tools showPrompt:@"网络请求超时，请稍候再试。" inView:self.view delay:1];
    }
    
}


- (void)requestFinished:(ASIHTTPRequest *)request{
    NSLog(@"%@",request.responseString);
    
    if (request.responseStatusCode == 404) {
        [Tools showPrompt:@"网络请求超时，请稍候再试。" inView:self.view delay:1];
    } else {
        NSString * msg, * resStatus ;
        NSString * respStr = request.responseString;
        NSDictionary * dict = [respStr JSONValue];
        msg = [dict objectForKey:@"msg"];
        resStatus = [dict objectForKey:@"status"];
        if (request.tag == 1) {// 修改密码
            
            if ([resStatus isEqualToString:@"1"]) {
                
//                [[MVNOUser currentUser] loginOut];
                [Tools showPrompt:@"密码修改成功,请牢记新密码！" inView:self.view delay:1.3];

                
                [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
                
            }
            
            else {
                //msg = @"用户名或服务密码错误，请重新输入";
                [Tools showPrompt:msg inView:self.view delay:1.3];
                
//                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }

        
    }
    
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

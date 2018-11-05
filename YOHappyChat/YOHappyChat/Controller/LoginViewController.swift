//
//  LoginViewController.swift
//  YOHappyChat
//
//  Created by yangou on 2018/11/5.
//  Copyright © 2018 hello. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController,UITextFieldDelegate {

  
    var userNameField : UITextField!
    var userPasswordField : UITextField!
    var nameString:String?
    var passwordString:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black
        initializeView()
    }
    
    func initializeView() {
        
        userNameField = UITextField(frame: CGRect(x: 20, y: 150, width: self.view.frame.size.width - 40, height: 50))
        userNameField.backgroundColor = UIColor.white
        userNameField.placeholder = "请输入姓名"
        userNameField.textColor = UIColor.black
        userNameField.delegate = self;
        userNameField.tag = 10;
        userNameField.layer.cornerRadius = 4;
        userNameField.clipsToBounds = true
        userNameField.font = UIFont.systemFont(ofSize: 17)
        self.view.addSubview(userNameField)
        
        
      
        
        userPasswordField = UITextField(frame: CGRect(x: 20, y: 220, width: self.view.frame.size.width - 40, height: 50))
        userPasswordField.backgroundColor = UIColor.white
        userPasswordField.placeholder = "请输入密码"
        userPasswordField.textColor = UIColor.black
        userPasswordField.delegate = self;
        userPasswordField.tag = 12;
        userPasswordField.layer.cornerRadius = 4;
        userPasswordField.clipsToBounds = true
        userPasswordField.font = UIFont.systemFont(ofSize: 17)
        self.view.addSubview(userPasswordField)
        
        let registerButton = UIButton(frame:CGRect(x: 20, y: 300, width: self.view.frame.size.width - 40, height: 50));
        registerButton.backgroundColor = UIColor.red
        registerButton .setTitle("login In", for: .normal)
        registerButton .setTitleColor(UIColor.black, for: .normal)
        registerButton.layer.cornerRadius = 4;
        registerButton.clipsToBounds = true;
        registerButton .addTarget(self, action: #selector(pressToRegister), for: .touchUpInside)
        self.view.addSubview(registerButton)
        
        
    }
    
    /**注册相关事件*/
    @objc func pressToRegister(){
        
        self.view.endEditing(true);
        if nameString == nil || nameString!.count == 0{
            
            SVProgressHUD.showInfo(withStatus:"请输入用户名")
            return;
        }
        
        if passwordString == nil || passwordString!.count == 0{
            SVProgressHUD.showInfo(withStatus:"请输入密码")
            return;
        }

        BmobUser.loginWithUsername(inBackground: nameString, password: passwordString) { (isSuccessful, error) in
            
            if (isSuccessful != nil){
                
                print("登录成功")
                let chatVC = ChatViewController ()
                chatVC.navigationItem.title = "chat"
                self.navigationController?.pushViewController(chatVC, animated: true)
                
            }else{
                
                print("登录失败 错误原因\(error!.localizedDescription)")
                
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let textString = textField.text;
        if textField.tag == 10{
            nameString = textString;
        }else{
            passwordString = textString;
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

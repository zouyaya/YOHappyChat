//
//  RootViewController.swift
//  YOHappyChat
//
//  Created by yangou on 2018/11/5.
//  Copyright © 2018 hello. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Happy Chat"
        
        initializeView()
        
    }
    
    
    func initializeView() {
        
        let registerButton = UIButton(frame: CGRect(x: 20, y: 170, width: self.view.frame.size.width - 40, height: 60))
        registerButton.backgroundColor = UIColor.red
        registerButton .setTitle("rigister", for: .normal)
        registerButton .setTitleColor(UIColor.black, for: .normal)
        registerButton.layer.cornerRadius = 30;
        registerButton.clipsToBounds = true;
        registerButton .addTarget(self, action: #selector(pressToRegister), for: .touchUpInside)
        self.view.addSubview(registerButton)
        
        
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: 370, width: self.view.frame.size.width - 40, height: 60))
        loginButton.backgroundColor = UIColor.red
        loginButton .setTitle("login In", for: .normal)
        loginButton.layer.cornerRadius = 30;
        loginButton.clipsToBounds = true;
        loginButton .setTitleColor(UIColor.black, for: .normal)
        loginButton .addTarget(self, action: #selector(pressToLogin), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        
        
    }
    
    /**
     注册的相关操作
     */
    @objc func pressToRegister(){
        
        let registerVC = RegisterViewController()
        registerVC.navigationItem.title = "Register"
        self.navigationController?.pushViewController(registerVC, animated: true)
        

    }
    /**
     登录的相关操作
     */
    @objc func pressToLogin(){
        
        
        let loginVC = LoginViewController()
        loginVC.navigationItem.title = "Login In"
        self.navigationController?.pushViewController(loginVC, animated: true)
        
        
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

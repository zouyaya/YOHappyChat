//
//  ChatViewController.swift
//  YOHappyChat
//
//  Created by yangou on 2018/11/5.
//  Copyright © 2018 hello. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    var messageTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        initializeView()
    }
    
/**
初始化页面
*/
    func initializeView() {
        
        let loginOutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        loginOutButton.setTitleColor(UIColor.blue, for: .normal)
        loginOutButton.setTitle("loginOut", for: .normal)
        loginOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        loginOutButton .addTarget(self, action: #selector(pressLoginOut), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: loginOutButton)
        
        
        
    }
    
    @objc func pressLoginOut(){
        
        BmobUser.logout()
        self.navigationController?.popViewController(animated: true)
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

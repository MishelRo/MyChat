//
//  AuthViewController.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    var model: ModelRegisterViewController!

    var eMailTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter email"
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    var chatImage: UILabel = {
        let chatImage = UILabel()
        chatImage.text = "Register"
        chatImage.font = UIFont(name: "Optima", size: 34)
        chatImage.textAlignment = .center
        chatImage.layer.cornerRadius = 15
        return chatImage
    }()
    
    
    var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter password"
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 40
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        return button
    }()
    
    private func layout() {
        let sizeTextField = view.bounds.width - 50
        view.addSubview(eMailTF)
        eMailTF.snp.makeConstraints { make in
            make.top.equalTo(view).inset(320)
            make.left.equalTo(view).inset(25)
            make.height.equalTo(32)
            make.width.equalTo(sizeTextField)
        }
        
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(eMailTF).inset(55)
            make.left.equalTo(view).inset(25)
            make.height.equalTo(32)
            make.width.equalTo(sizeTextField)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTF).inset(70)
            make.left.equalTo(view).inset(15)
            make.centerX.equalTo(view)
            make.height.equalTo(70)
        }
        
        view.addSubview(chatImage)
        chatImage.snp.makeConstraints { make in
            make.top.equalTo(view).inset(220)
            make.left.equalTo(view).inset(15)
            make.centerX.equalTo(view)
            make.height.equalTo(70)
        }
    }
    
    @objc func registerButtonTap(sender: UIButton!) {
        let user = User(email: eMailTF.getText(), password: passwordTF.getText())
        model.register(user: user) {
            self.navigationController?.pushViewController(ChatViewController(), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        model = ModelRegisterViewController()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(signOutButton))
    }
    
    @objc func  signOutButton() {
    }
    
}

//
//  AuthenticationMainView.swift
//  EdgeCenterVodDemo
//
//  Created by Evgenij Polubin on 19.07.2022.
//

import UIKit

protocol LoginMainViewDelegate: AnyObject {
    func signOn(username: String, password: String)
    func showDemoScreen()
    func errorHandle(_ error: Error)
}

final class LoginMainView: UIView {
    weak var delegate: LoginMainViewDelegate?

    var isLoading = false {
        didSet { signButton.isEnabled = !isLoading }
    }

    private let ecLogo = UIImageView(image: .ecLogo)

    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .grey800
        label.textAlignment = .center
        
        return label
    }()
    
    private let labelSubtitle: UILabel = {
        let label = UILabel()
        label.text = "Рады видеть вас снова!"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .grey600
        label.textAlignment = .center
        
        return label
    }()

    private lazy var textFieldPassword: TextField = {
        let hidingPasswordButton = UIButton()
        hidingPasswordButton.setImage(.closeEyeIcon, for: .normal)
        hidingPasswordButton.addTarget(self, action: #selector(tapHidingPasswordButton(sender:)), for: .touchUpInside)
        
        let field = TextField(placeholder: "Пароль")
        field.rightView = hidingPasswordButton
        field.rightViewMode = .always
        field.isSecureTextEntry = true
       
        return field
    }()
    
    private let textFieldEmail = TextField(placeholder: "Электронная почта")
    
    private lazy var signButton: UIButton = {
        let button = Button()
        button.addTarget(self, action: #selector(tapSignButton), for: .touchUpInside)
        button.backgroundColor = .grey800
        button.layer.cornerRadius = 4
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()

    private lazy var demoButton: UIButton = {
        let button = Button()
        button.addTarget(self, action: #selector(tapDemoButton), for: .touchUpInside)
        button.backgroundColor = .grey800
        button.layer.cornerRadius = 4
        button.setTitle("Посмотреть демо", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextFields()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextFields()
        initLayout()
    }
    
    private func setupTextFields() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    @objc private func tapHidingPasswordButton(sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setImage(.openEyeIcon, for: .normal)
            textFieldPassword.isSecureTextEntry = false
        } else {
            sender.tag = 0
            sender.setImage(.closeEyeIcon, for: .normal)
            textFieldPassword.isSecureTextEntry = true
        }
    }
    
    @objc private func tapSignButton() {
        guard let credential = getCredential() else {
            delegate?.errorHandle(LoginModuleError.emptyTextFields)
            return
        }
        
        isLoading = true
        delegate?.signOn(username: credential.username, password: credential.password)
    }

    @objc private func tapDemoButton() {
        guard !isLoading else { return }
        delegate?.showDemoScreen()
    }
    
    private func getCredential() -> (username: String, password: String)? {
        guard let username = textFieldEmail.text, let password = textFieldPassword.text else { return nil }
        return (username, password)
    }
    
    private func initLayout() {
        for view in [ecLogo, labelTitle, labelSubtitle, textFieldEmail, textFieldPassword, signButton, demoButton] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            ecLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            ecLogo.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30),
            
            labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelTitle.topAnchor.constraint(equalTo: ecLogo.bottomAnchor, constant: 75),
            
            labelSubtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 12),
            
            textFieldEmail.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldEmail.widthAnchor.constraint(equalToConstant: ScreenSize.width - 32),
            textFieldEmail.topAnchor.constraint(equalTo: labelSubtitle.bottomAnchor, constant: 32),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 46),
            
            textFieldPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalToConstant: ScreenSize.width - 32),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 46),
            
            signButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: ScreenSize.width - 32),
            signButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
            signButton.heightAnchor.constraint(equalToConstant: 48),

            demoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            demoButton.widthAnchor.constraint(equalToConstant: ScreenSize.width - 32),
            demoButton.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 10),
            demoButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

//MARK: - UITextFieldDelegate

extension LoginMainView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            return textField.becomeFirstResponder()
        }
        
        if textField == textFieldPassword  {
            guard let credential = getCredential() else {
                delegate?.errorHandle(LoginModuleError.emptyTextFields)
                return textField.resignFirstResponder()
            }
            
            delegate?.signOn(username: credential.username, password: credential.password)
        }
        
        return true
    }
}

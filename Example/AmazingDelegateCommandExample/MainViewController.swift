//
//  MainViewController.swift
//  AmazingDelegateCommandExample
//
//  Created by t.khamidov on 24.03.2021.
//

import UIKit
import SnapKit
import AmazingDelegateCommand

class StringWrapper {
    var string: String = ""
}

final class MainViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        stackView.addArrangedSubview(fourthButton)
        
        return stackView
    }()
    
    private lazy var firstButton: AmazingDelegateCommandButton = {
       let button = AmazingDelegateCommandButton()
        
        button.setTitle("PRINT", for: .normal)
        button.setTitle("CAN'T PRINT", for: .disabled)
        
        button.backgroundColor = .systemTeal
        
        let stringWrapper = StringWrapper()
        stringWrapper.string = "HA!"
        
        button.command = printCommand
        button.commandParameter = stringWrapper
        
        return button
    }()
    
    private lazy var secondButton: AmazingDelegateCommandButton = {
       let button = AmazingDelegateCommandButton()
        
        button.setTitle("ENABLE PRINT", for: .normal)
        
        button.backgroundColor = .systemGreen
        
        button.command = enablePrintCommand
        
        return button
    }()
    
    private lazy var thirdButton: AmazingDelegateCommandButton = {
        let button = AmazingDelegateCommandButton()
        
        button.setTitle("DISABLE PRINT", for: .normal)
        
        button.backgroundColor = .systemRed
        
        button.command = disablePrintCommand
        
        return button
    }()
    
    private lazy var fourthButton: AmazingDelegateCommandButton = {
        let button = AmazingDelegateCommandButton()
        
        button.setTitle("CHANGE PRINT", for: .normal)
        
        button.backgroundColor = .systemGray
        
        button.command = changePrintCommand
        button.commandParameter = "HA-HA!"
        
        return button
    }()
    
    private var canExecutePrintCommand = true
    
    private var printCommand: AmazingDelegateCommand<MainViewController, StringWrapper>!
    private var enablePrintCommand: AmazingDelegateCommand<MainViewController, Void>!
    private var disablePrintCommand: AmazingDelegateCommand<MainViewController, Void>!
    private var changePrintCommand: AmazingDelegateCommand<MainViewController, String>!
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        printCommand = AmazingDelegateCommand(target: self,
                                              executeAction: MainViewController.printCommandExecute,
                                              canExecuteAction: MainViewController.printCommandCanExecute)
        
        enablePrintCommand = AmazingDelegateCommand(target: self, executeAction: MainViewController.enablePrintCommamdExecute)
        disablePrintCommand = AmazingDelegateCommand(target: self, executeAction: MainViewController.disablePrintCommandExecute)
        
        changePrintCommand = AmazingDelegateCommand(target: self, executeAction: MainViewController.changePrintCommandExecute)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSuviews()
        makeConstraints()
    }
    
    // MARK: - Private Methods
    
    private func addSuviews() {
        view.addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.center.equalToSuperview()
        }
    }
    
    private func printCommandExecute(_ parameter: StringWrapper) {
        print(parameter.string)
    }
    
    private func printCommandCanExecute(_ parameter: StringWrapper) -> Bool {
        canExecutePrintCommand
    }
    
    private func enablePrintCommamdExecute(_: ()) {
        canExecutePrintCommand = true
        
        printCommand.raiseCanExecuteDidChange()
    }
    
    private func disablePrintCommandExecute(_: ()) {
        canExecutePrintCommand = false
        
        printCommand.raiseCanExecuteDidChange()
    }
    
    private func changePrintCommandExecute(_ parameter: String) {
        let newStringWrapper = (firstButton.commandParameter as! StringWrapper)
        newStringWrapper.string = parameter
        
        firstButton.commandParameter = newStringWrapper
    }
}

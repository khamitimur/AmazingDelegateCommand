//
//  AmazingDelegateCommandButton.swift
//  AmazingDelegateCommandCocoa
//
//  Created by t.khamidov on 25.03.2021.
//

import UIKit
import AmazingDelegateCommand

open class AmazingDelegateCommandButton: UIButton, AmazingDelegateCommandDelegate {
    
    // MARK: - Public Properties
    
    public var command: IAmazingDelegateCommand? {
        didSet {
            addOrRemoveTarget()
            canExecuteDidChange()
        }
    }
    
    public var commandParameter: Any = () {
        didSet {
            canExecuteDidChange()
        }
    }
    
    // MARK: - AmazingDelegateCommandDelegate
    
    public func canExecuteDidChange() {
        isEnabled = command?.canExecute(commandParameter) ?? true
    }
    
    // MARK: - Private Methods
    
    private func addOrRemoveTarget() {
        if let command = command {
            command.addDelegate(self)
            
            addTarget(self, action: #selector(handleTouchUpInside), for: .touchUpInside)
        } else {
            removeTarget(self, action: #selector(handleTouchUpInside), for: .touchUpInside)
        }
    }
    
    @objc
    private func handleTouchUpInside() {
        command?.execute(commandParameter)
    }
}

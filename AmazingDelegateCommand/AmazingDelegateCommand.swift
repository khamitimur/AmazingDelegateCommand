//
//  AmazingDelegateCommand.swift
//  AmazingCommands
//
//  Created by t.khamidov on 23.03.2021.
//

public final class AmazingDelegateCommand<Target: AnyObject, T: Any>: IAmazingDelegateCommand {
    
    // MARK: - Type Aliases
    
    public typealias ExecuteAction = (Target) -> (T) -> Void
    public typealias CanExecuteAction = (Target) -> (T) -> Bool
    
    // MARK: - Private Properties
    
    private weak var target: Target?
    
    private let executeAction: ExecuteAction
    private let canExecuteAction: CanExecuteAction?
    
    // MARK: - Initializers
    
    public init(target: Target,
                executeAction: @escaping ExecuteAction,
                canExecuteAction: CanExecuteAction? = nil) {
        self.target = target
        
        self.executeAction = executeAction
        self.canExecuteAction = canExecuteAction
    }
    
    // MARK: - IAmazingDelegateCommand
    
    public func execute(_ parameter: Any) {
        guard let target = target else {
            return
        }
        
        guard let parameter = parameter as? T else { return }
        
        executeAction(target)(parameter)
    }
    
    public func canExecute(_ parameter: Any) -> Bool {
        guard let target = target else {
            return false
        }
        
        guard let canExecuteAction = canExecuteAction else {
            return true
        }
        
        guard let parameter = parameter as? T else {
            return false
        }
        
        return canExecuteAction(target)(parameter)
    }
    
    private weak var delegate: AmazingDelegateCommandDelegate?
    
    public func addDelegate(_ delegate: AmazingDelegateCommandDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    public func raiseCanExecuteDidChange() {
        delegate?.canExecuteDidChange()
    }
}

import UIKit

public class AmazingDelegateCommandButton: UIButton, AmazingDelegateCommandDelegate {
    
    // MARK: - Properties
    
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
    
    private func addOrRemoveTarget() {
        if let command = command {
            command.addDelegate(self)
            
            addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        } else {
            removeTarget(self, action: #selector(handleTap), for: .touchUpInside)
        }
    }
    
    @objc
    private func handleTap() {
        command?.execute(commandParameter)
    }
    
    // MARK: - AmazingDelegateCommandDelegate
    
    public func canExecuteDidChange() {
        isEnabled = command?.canExecute(commandParameter) ?? true
    }
}

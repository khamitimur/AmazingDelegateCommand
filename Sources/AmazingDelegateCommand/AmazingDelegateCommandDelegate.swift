//
//  AmazingDelegateCommandDelegate.swift
//  AmazingDelegateCommand
//
//  Created by t.khamidov on 25.03.2021.
//

public protocol AmazingDelegateCommandDelegate: AnyObject {
    
    // MARK: - Methods
    
    func canExecuteDidChange()
}

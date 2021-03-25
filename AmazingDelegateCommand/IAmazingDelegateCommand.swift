//
//  IAmazingDelegateCommand.swift
//  AmazingCommands
//
//  Created by t.khamidov on 23.03.2021.
//

public protocol IAmazingDelegateCommand {
    
    // MARK: - Methods
    
    func execute(_ parameter: Any?)
    
    func canExecute(_ parameter: Any?) -> Bool
    
    func addDelegate(_ delegate: AmazingDelegateCommandDelegate)
}

//
//  AmazingDelegateCommand+Void.swift
//  AmazingCommands
//
//  Created by t.khamidov on 23.03.2021.
//

public extension AmazingDelegateCommand where T == Void {
    
    // MARK: - Methods
    
    func execute() {
        execute(())
    }
    
    func canExecute() -> Bool {
        canExecute(())
    }
}

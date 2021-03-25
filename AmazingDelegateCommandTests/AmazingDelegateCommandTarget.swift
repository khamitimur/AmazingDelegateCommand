//
//  AmazingDelegateCommandTarget.swift
//  AmazingDelegateCommandTests
//
//  Created by t.khamidov on 25.03.2021.
//

@testable import AmazingDelegateCommand

final class AmazingDelegateCommandTarget<T> {
    
    // MARK: - Properties
    
    var invokedTestCommandExecute = false
    var invokedTestCommandExecuteParameter: T?
    
    // MARK: - Methods
    
    func testCommandExecute(_ parameter: T) {
        invokedTestCommandExecute = true
        invokedTestCommandExecuteParameter = parameter
    }
}

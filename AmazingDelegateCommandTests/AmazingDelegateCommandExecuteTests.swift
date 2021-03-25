//
//  AmazingDelegateCommandExecuteTests.swift
//  AmazingDelegateCommandTests
//
//  Created by t.khamidov on 25.03.2021.
//

import XCTest

@testable import AmazingDelegateCommand

final class AmazingDelegateCommandExecuteTests: XCTestCase {

    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }

    // MARK: - Tests
    
    func test_execute_whenValueParameter_whenValueType() throws {
        let parameter: Int = 5
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertTrue(target.invokedTestCommandExecute)
        XCTAssertEqual(target.invokedTestCommandExecuteParameter!, parameter)
    }
    
    func test_execute_whenValueParameter_whenOptionalValueType() throws {
        let parameter: Int = 5
        let target = AmazingDelegateCommandTarget<Int?>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertTrue(target.invokedTestCommandExecute)
        XCTAssertEqual(target.invokedTestCommandExecuteParameter!, parameter)
    }
    
    func test_execute_whenValueParameter_whenWrongValueType() throws {
        let parameter: Int = 5
        let target = AmazingDelegateCommandTarget<String>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertFalse(target.invokedTestCommandExecute)
    }
    
    func test_execute_whenValueParameter_whenWrongOptionalValueType() throws {
        let parameter: Int = 5
        let target = AmazingDelegateCommandTarget<String?>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertFalse(target.invokedTestCommandExecute)
    }
    
    func test_execute_whenOptionalValueParameter_whenValueType() throws {
        let parameter: Int? = 5
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertTrue(target.invokedTestCommandExecute)
        XCTAssertEqual(target.invokedTestCommandExecuteParameter!, parameter)
    }
    
    func test_execute_whenOptionalValueParameterIsNil_whenValueType() throws {
        let parameter: Int? = nil
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target, executeAction: AmazingDelegateCommandTarget.testCommandExecute)
        
        command.execute(parameter)
        
        XCTAssertFalse(target.invokedTestCommandExecute)
    }
}

import XCTest

@testable import AmazingDelegateCommand

final class AmazingDelegateCommandCanExecuteTests: XCTestCase {

    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }

    // MARK: - Tests
    
    func test_canExecute_whenValueParameter_whenValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingDelegateCommandTarget<Int?>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingDelegateCommandTarget<String>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingDelegateCommandTarget<String?>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
    
    func test_canExecute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5
        
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil
        
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<AmazingDelegateCommandParameter>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<AmazingDelegateCommandParameter?>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!!.value, parameterValue)
    }

    func test_canExecute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<AnotherAmazingDelegateCommandParameter>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }

    func test_canExecute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<AnotherAmazingDelegateCommandParameter?>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }

    func test_canExecute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<AmazingDelegateCommandParameter>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertTrue(target.invokedTestCommandCanExecute)
        XCTAssertEqual(target.invokedTestCommandCanExecuteParameter!.value, parameterValue)
    }

    func test_canExecute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingDelegateCommandParameter? = nil
        
        let target = AmazingDelegateCommandTarget<AmazingDelegateCommandParameter>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)

        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingDelegateCommandTarget<AnotherAmazingDelegateCommandParameter>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingDelegateCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingDelegateCommandTarget<Int>()
        let command = AmazingDelegateCommand(target: target,
                                             executeAction: AmazingDelegateCommandTarget.testCommandExecute,
                                             canExecuteAction: AmazingDelegateCommandTarget.testCommandCanExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedTestCommandCanExecute)
    }
}

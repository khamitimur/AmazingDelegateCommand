import XCTest

@testable import AmazingTargetCommand

final class AmazingTargetCommandCanExecuteTests: XCTestCase {

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
        
        let target = AmazingTargetCommandTarget<Int>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingTargetCommandTarget<Int?>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenValueParameter_whenWrongValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingTargetCommandTarget<String>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenWrongOptionalValueType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingTargetCommandTarget<String?>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenOptionalValueParameter_whenValueType() throws {
        // given
        let parameter: Int? = 5
        
        let target = AmazingTargetCommandTarget<Int>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!, parameter)
    }
    
    func test_canExecute_whenOptionalValueParameterIsNil_whenValueType() throws {
        // given
        let parameter: Int? = nil
        
        let target = AmazingTargetCommandTarget<Int>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<AmazingTargetCommandParameter>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }
    
    func test_canExecute_whenReferenceParameter_whenOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<AmazingTargetCommandParameter?>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!!.value, parameterValue)
    }

    func test_canExecute_whenReferenceParameter_whenWrongReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<AnotherAmazingTargetCommandParameter>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertFalse(target.invokedCanExecute)
    }

    func test_canExecute_whenReferenceParameter_whenWrongOptionalReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<AnotherAmazingTargetCommandParameter?>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertFalse(target.invokedCanExecute)
    }

    func test_canExecute_whenOptionalReferenceParameter_whenReferenceType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<AmazingTargetCommandParameter>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)

        // when
        _ = command.canExecute(parameter)

        // then
        XCTAssertTrue(target.invokedCanExecute)
        XCTAssertEqual(target.invokedCanExecuteParameter!.value, parameterValue)
    }

    func test_canExecute_whenOptionalReferenceParameterIsNil_whenReferenceType() throws {
        // given
        let parameter: AmazingTargetCommandParameter? = nil
        
        let target = AmazingTargetCommandTarget<AmazingTargetCommandParameter>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)

        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenValueParameter_whenReferenceType() throws {
        // given
        let parameter: Int = 5
        
        let target = AmazingTargetCommandTarget<AnotherAmazingTargetCommandParameter>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
    
    func test_canExecute_whenReferenceParameter_whenValueType() throws {
        // given
        let parameterValue: Int = 5
        let parameter: AmazingTargetCommandParameter? = .init(value: parameterValue)
        
        let target = AmazingTargetCommandTarget<Int>()
        let command = AmazingTargetCommand(target: target,
                                             executeAction: AmazingTargetCommandTarget.execute,
                                             canExecuteAction: AmazingTargetCommandTarget.canExecute)
        
        // when
        _ = command.canExecute(parameter)
        
        // then
        XCTAssertFalse(target.invokedCanExecute)
    }
}

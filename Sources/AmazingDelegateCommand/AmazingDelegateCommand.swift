import Foundation
import AmazingWeakSequence

public protocol IAmazingDelegateCommand {
    
    // MARK: - Methods
    
    /// Executes command.
    func execute(_ parameter: Any?)
    
    /// Returns a value that indicates whether the command can be executed with provided parameter.
    func canExecute(_ parameter: Any?) -> Bool
    
    /// Adds delegate.
    func addDelegate(_ delegate: AmazingDelegateCommandDelegate)
}

public final class AmazingDelegateCommand<Target: AnyObject, Parameter: Any>: IAmazingDelegateCommand {
    
    // MARK: - Type Aliases
    
    /// Action to be executed.
    public typealias ExecuteAction = (Target) -> (Parameter) -> Void
    
    /// Action that return a value that indicates whether the command can be executed with provided parameter.
    public typealias CanExecuteAction = (Target) -> (Parameter) -> Bool
    
    // MARK: - Private Properties
    
    /// Returns object that owns action to be execute.
    private weak var target: Target?
    
    private let executeAction: ExecuteAction
    private let canExecuteAction: CanExecuteAction?
    
    private let delegates = AmazingWeakSequence<AmazingDelegateCommandDelegate>()
    
    // MARK: - Initializers
    
    /// Initializes a new instance.
    /// - Parameters:
    ///   - target: Object that owns action to be execute.
    ///   - executeAction: Action to be executed.
    ///   - canExecuteAction: Action that return a value that indicates whether the command can be executed with provided parameter.
    public init(target: Target,
                executeAction: @escaping ExecuteAction,
                canExecuteAction: CanExecuteAction? = nil) {
        self.target = target
        
        self.executeAction = executeAction
        self.canExecuteAction = canExecuteAction
    }
    
    // MARK: - IAmazingDelegateCommand
    
    public func execute(_ parameter: Any?) {
        guard let target = target else {
            return
        }
        
        guard let parameter = parameter as? Parameter else { return }
        
        executeAction(target)(parameter)
    }
    
    public func canExecute(_ parameter: Any?) -> Bool {
        guard let target = target else {
            return false
        }
        
        guard let canExecuteAction = canExecuteAction else {
            return true
        }
        
        guard let parameter = parameter as? Parameter else {
            return false
        }
        
        return canExecuteAction(target)(parameter)
    }
    
    public func addDelegate(_ delegate: AmazingDelegateCommandDelegate) {
        delegates.add(delegate)
    }
    
    // MARK: - Public Methods
    
    /// Raises [canExecuteDidChange](x-source-tag://canExecuteDidChange) method of each delegate.
    public func raiseCanExecuteDidChange() {
        for delegate in delegates {
            delegate.canExecuteDidChange()
        }
    }
}

public extension AmazingDelegateCommand where Parameter == Void {
    
    // MARK: - Methods
    
    /// Executes command.
    func execute() {
        execute(())
    }
    
    /// Returns a value that indicates whether the command can be executed.
    func canExecute() -> Bool {
        canExecute(())
    }
}

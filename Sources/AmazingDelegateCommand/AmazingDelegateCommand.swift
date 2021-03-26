import Foundation
import AmazingWeakSequence

public protocol IAmazingDelegateCommand {
    
    // MARK: - Methods
    
    func execute(_ parameter: Any?)
    
    func canExecute(_ parameter: Any?) -> Bool
    
    func addDelegate(_ delegate: AmazingDelegateCommandDelegate)
}

public final class AmazingDelegateCommand<Target: AnyObject, T: Any>: IAmazingDelegateCommand {
    
    // MARK: - Type Aliases
    
    public typealias ExecuteAction = (Target) -> (T) -> Void
    public typealias CanExecuteAction = (Target) -> (T) -> Bool
    
    // MARK: - Private Properties
    
    private weak var target: Target?
    
    private let executeAction: ExecuteAction
    private let canExecuteAction: CanExecuteAction?
    
    private let delegates = AmazingWeakSequence<AmazingDelegateCommandDelegate>()
    
    // MARK: - Initializers
    
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
        
        guard let parameter = parameter as? T else { return }
        
        executeAction(target)(parameter)
    }
    
    public func canExecute(_ parameter: Any?) -> Bool {
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
    
    public func addDelegate(_ delegate: AmazingDelegateCommandDelegate) {
        delegates.add(delegate)
    }
    
    // MARK: - Public Methods
    
    public func raiseCanExecuteDidChange() {
        for delegate in delegates {
            delegate.canExecuteDidChange()
        }
    }
}

public extension AmazingDelegateCommand where T == Void {
    
    // MARK: - Methods
    
    func execute() {
        execute(())
    }
    
    func canExecute() -> Bool {
        canExecute(())
    }
}

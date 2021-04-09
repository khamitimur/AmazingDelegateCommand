/// Subscriber to [AmazingTargetCommand](x-source-tag://amazingTargetCommandProtocol) notifications.
public protocol AmazingTargetCommandSubscriber: AnyObject {
    
    // MARK: - Methods
    
    /// Notifies when command's ability to be executed did change.
    /// - Tag: canExecuteDidChange
    func canExecuteDidChange()
}

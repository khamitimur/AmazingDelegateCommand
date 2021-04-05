public protocol AmazingDelegateCommandDelegate: AnyObject {
    
    // MARK: - Methods
    
    /// Notifies when command's ability to be executed did change.
    /// - Tag: canExecuteDidChange
    func canExecuteDidChange()
}

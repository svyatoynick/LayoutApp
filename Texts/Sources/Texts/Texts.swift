import Foundation
import Models

public enum Texts {
    
    public enum Shared {
        
        public static var application_name: String { NSLocalizedString("application name", bundle: .module, comment: "") }
        
        public static var see_all: String { NSLocalizedString("see all", bundle: .module, comment: "") }
        public static var save: String { NSLocalizedString("save", bundle: .module, comment: "") }
        public static var saved: String { NSLocalizedString("saved", bundle: .module, comment: "") }
        public static var update: String { NSLocalizedString("update", bundle: .module, comment: "") }
        public static var updated: String { NSLocalizedString("updated", bundle: .module, comment: "") }
        public static var create: String { NSLocalizedString("create", bundle: .module, comment: "") }
        public static var created: String { NSLocalizedString("created", bundle: .module, comment: "") }
        public static var edit: String { NSLocalizedString("edit", bundle: .module, comment: "") }
        public static var edited: String { NSLocalizedString("edited", bundle: .module, comment: "") }
        public static var delete: String { NSLocalizedString("delete", bundle: .module, comment: "") }
        public static var deleted: String { NSLocalizedString("deleted", bundle: .module, comment: "") }
        public static var cancel: String { NSLocalizedString("cancel", bundle: .module, comment: "") }
        public static var canceled: String { NSLocalizedString("canceled", bundle: .module, comment: "") }
        public static var completed: String { NSLocalizedString("completed", bundle: .module, comment: "") }
        public static var discard_changes: String { NSLocalizedString("discard changes", bundle: .module, comment: "") }
        public static var accept: String { NSLocalizedString("accept", bundle: .module, comment: "") }
        public static var accepted: String { NSLocalizedString("accepted", bundle: .module, comment: "") }
        public static var decline: String { NSLocalizedString("decline", bundle: .module, comment: "") }
        public static var declined: String { NSLocalizedString("declined", bundle: .module, comment: "") }
        
        public static var error: String { NSLocalizedString("error", bundle: .module, comment: "") }
        public static var close: String { NSLocalizedString("close", bundle: .module, comment: "") }
        public static var clear: String { NSLocalizedString("clear", bundle: .module, comment: "") }
        public static var ok: String { NSLocalizedString("ok", bundle: .module, comment: "") }
        public static var empty: String { NSLocalizedString("empty", bundle: .module, comment: "") }
    }
}

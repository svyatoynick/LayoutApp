import Foundation
import Constants

extension Constants {
    
    enum Bundles {
        
        static var app: String { "by.ivanvorobei.apps.sparrowcode" }
    }
    
    enum Scenes {
        
        static var root: String { "Root Scene" }
        static var settings: String { "Settings Scene" }
        static var expenseDetail: String { "Expense Detail Scene" }
    }
    
    enum UserActivities {
        
        static var show_settings: String {  Constants.Bundles.app + ".showSettings" }
        static var show_expense_detail: String {  Constants.Bundles.app + ".showExpenseDetail" }
        
        enum UserInfoKeys {
            
            static var expense_id_key: String { "expenseID" }
        }
    }
}

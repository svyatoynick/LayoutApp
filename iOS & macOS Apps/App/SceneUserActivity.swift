import UIKit
import Constants

class SceneUserActivity: NSUserActivity {
    
    let action: Action
    
    init(_ action: Action) {
        self.action = action
        super.init(activityType: action.id)
        switch action {
        case .showExpenseDetail(let expenseID):
            userInfo = [Constants.UserActivities.UserInfoKeys.expense_id_key : expenseID]
        default:
            break
        }
    }
    
    var scene: UISceneConfiguration.Scene {
        switch action {
        case .showSettings:
            return .settings
        case .showExpenseDetail(let expenseID):
            return .expenseDetail(id: expenseID)
        }
    }
    
    // MARK: - Models
    
    enum Action {
        
        case showSettings
        case showExpenseDetail(id: String)
        
        fileprivate var id: String {
            switch self {
            case .showSettings: return Constants.UserActivities.show_settings
            case .showExpenseDetail: return Constants.UserActivities.show_expense_detail
            }
        }
    }
}

/*
extension NSUserActivity {
    
    enum ActivityType {
        
        case showSettings
        case showExpenseDetail(id: String)
        
        fileprivate var id: String {
            switch self {
            case .showSettings: return Constants.UserActivities.show_settings
            case .showExpenseDetail: return Constants.UserActivities.show_expense_detail
            }
        }
        
        var scene: UISceneConfiguration.Scene {
            switch self {
            case .showSettings: return .settings
            case .showExpenseDetail(_): return .expenseDetail
            }
        }
        
        static func get(by activity: NSUserActivity?) -> ActivityType? {
            guard let activity = activity else { return nil }
            let id = activity.activityType
            let userInfo = activity.userInfo
            switch id {
            case self.showSettings.id:
                return .showSettings
            case self.showExpenseDetail(id: String.empty).id:
                guard let expenseID = userInfo?[Constants.UserActivities.UserInfoKeys.expense_id_key] as? String else { return nil }
                return .showExpenseDetail(id: expenseID)
            default:
                return nil
            }
        }
    }
    
    convenience init(activityType: ActivityType) {
        self.init(activityType: activityType.id)
        switch activityType {
        case .showExpenseDetail(let expenseID):
            userInfo = [Constants.UserActivities.UserInfoKeys.expense_id_key : expenseID]
        default:
            break
        }
    }
}
*/

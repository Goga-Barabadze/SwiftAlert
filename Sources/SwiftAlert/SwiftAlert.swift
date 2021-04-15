import UIKit

public class Alert {
    
    public static func alert(title: String? = nil, message: String? = nil, target: UIViewController = UIApplication.currentViewController()!, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)], textFields: [((UITextField) -> Void)?] = [], preferredStyle: UIAlertController.Style = .actionSheet){
        
        var style = preferredStyle
        
        if style == .actionSheet && !textFields.isEmpty {
            style = .alert
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = target.view
            popoverController.sourceRect = CGRect(x: target.view.bounds.midX, y: target.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        for action in actions {
            alert.addAction(action)
        }
        
        for textField in textFields {
            alert.addTextField(configurationHandler: textField)
        }
        
        target.present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIApplication{

    public class func currentViewController() -> UIViewController? {

        var presentViewController = UIApplication.shared.keyWindow?.rootViewController

        while let pVC = presentViewController?.presentedViewController{
            presentViewController = pVC
        }

        return presentViewController
    }

}

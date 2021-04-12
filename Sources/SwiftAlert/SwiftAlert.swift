import UIKit

public class Alert {
    
    public static func alert(title: String?, message: String?, target: UIViewController = UIApplication.currentViewController()!, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)]){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = target.view
            popoverController.sourceRect = CGRect(x: target.view.bounds.midX, y: target.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        for action in actions {
            alert.addAction(action)
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

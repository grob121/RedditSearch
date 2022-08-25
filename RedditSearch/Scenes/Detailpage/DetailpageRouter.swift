import UIKit

@objc protocol DetailpageRoutingLogic {
    func routeToWebpage(_ urlString: String)
}

protocol DetailpageDataPassing {
    var dataStore: DetailpageDataStore? { get set }
}

class DetailpageRouter: DetailpageRoutingLogic, DetailpageDataPassing {
    weak var viewController: DetailpageViewController?
    weak var vc: UIViewController?
    var dataStore: DetailpageDataStore?
    
    init(_ vc: UIViewController) {
        self.vc = vc
    }
    
    func routeToWebpage(_ urlString: String) {
        let destinationVC = WebpageViewController.initFromStoryboard()
        guard var destinationDS = destinationVC.router?.dataStore else { return }
        destinationDS.urlString = urlString
        guard let navigationController = viewController?.navigationController else {
            viewController?.present(destinationVC, animated: true, completion: nil)
            return
        }
        navigationController.pushViewController(destinationVC, animated: true)
    }
}

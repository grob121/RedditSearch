import UIKit

@objc protocol HomepageRoutingLogic {
    func routeToDetailpage(_ subreddit: String)
}

class HomepageRouter: HomepageRoutingLogic {
    weak var viewController: HomepageViewController?
    weak var vc: UIViewController?
    
    init(_ vc: UIViewController) {
        self.vc = vc
    }
    
    // MARK: Routing
    func routeToDetailpage(_ subreddit: String) {
        let destinationVC = DetailpageViewController.initFromStoryboard()
        guard var destinationDS = destinationVC.router?.dataStore else { return }
        destinationDS.subreddit = subreddit
        guard let navigationController = viewController?.navigationController else {
            viewController?.present(
                destinationVC,
                animated: true,
                completion: nil)
            return
        }
        navigationController.pushViewController(destinationVC, animated: true)
    }
}

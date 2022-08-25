import UIKit

protocol WebpageDataPassing {
    var dataStore: WebpageDataStore? { get set }
}

class WebpageRouter: WebpageDataPassing {
    weak var vc: UIViewController?
    var dataStore: WebpageDataStore?
    
    init(_ vc: UIViewController) {
        self.vc = vc
    }
}

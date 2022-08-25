import UIKit

protocol WebpageBusinessLogic {
    func redirectToURL(_ request: Webpage.Redirect.Request)
}

protocol WebpageDataStore {
    var urlString: String { get set }
}

class WebpageInteractor: WebpageDataStore {
    // DataStore
    var urlString: String = ""
    
    var presenter: WebpagePresentationLogic?
}

extension WebpageInteractor: WebpageBusinessLogic {
    func redirectToURL(_ request: Webpage.Redirect.Request) {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            presenter?.presentError(.init(message: "Invalid URL"))
            return
        }
        presenter?.presentWebData(.init(url: urlString))
    }
}

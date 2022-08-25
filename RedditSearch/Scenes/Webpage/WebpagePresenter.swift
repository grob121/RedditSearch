import UIKit

protocol WebpagePresentationLogic {
    func presentWebData(_ response: Webpage.Redirect.Response)
    func presentError(_ response: Webpage.Error.Response)
}

class WebpagePresenter: WebpagePresentationLogic {
    weak var viewController: WebpageDisplayLogic?
    
    func presentWebData(_ response: Webpage.Redirect.Response) {
        guard let link = URL(string: response.url) else {
            viewController?.displayError(.init(message: "Invalid request"))
            return
        }
        let request = URLRequest(url: link)
        viewController?.displayWebData(.init(request: request))
    }
    
    func presentError(_ response: Webpage.Error.Response) {
        viewController?.displayError(.init(message: response.message))
    }
}

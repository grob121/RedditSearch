import UIKit
import WebKit

protocol WebpageDisplayLogic: class {
    func displayWebData(_ viewModel: Webpage.Redirect.ViewModel)
    func displayError(_ viewModel: Webpage.Error.ViewModel)
}

class WebpageViewController: BaseViewController {
    @IBOutlet weak private var webView: WKWebView!
    
    var interactor: WebpageBusinessLogic?
    var router: WebpageDataPassing?
    var urlString = ""
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = WebpageInteractor()
        let presenter =  WebpagePresenter()
        let router = WebpageRouter(self)
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
    }
    
    static func initFromStoryboard() -> WebpageViewController {
        return UIStoryboard(name: "Webpage", bundle: nil).instantiateInitialViewController() as? WebpageViewController ?? WebpageViewController()
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        showLoading()
        interactor?.redirectToURL(.init())
    }
    
    private func setupWebView() {
        webView.navigationDelegate = self
        webView.isHidden = true
    }
}

// MARK: WKNavigation Delegate
extension WebpageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
        webView.isHidden = false
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoading()
        self.displayAlert("Cannot load webpage")
    }
}

// MARK: DisplayLogic
extension WebpageViewController: WebpageDisplayLogic {
    func displayWebData(_ viewModel: Webpage.Redirect.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.webView.load(viewModel.request)
        }
    }
    
    func displayError(_ viewModel: Webpage.Error.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.displayAlert(viewModel.message)
        }
    }
}

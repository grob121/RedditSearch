import UIKit

protocol DetailpageDisplayLogic: class {
    func displayUserPostsData(_ viewModel: Detailpage.UserPosts.ViewModel)
    func displayError(_ viewModel: Detailpage.Error.ViewModel)
}

class DetailpageViewController: BaseViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    var interactor: DetailpageBusinessLogic?
    var router: (DetailpageRoutingLogic & DetailpageDataPassing)?
    private var userPosts = [Detailpage.List]()
    
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
        let worker = DetailpageWorker()
        let interactor =  DetailpageInteractor(worker)
        let presenter =  DetailpagePresenter()
        let router = DetailpageRouter(self)
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    static func initFromStoryboard() -> DetailpageViewController {
        return UIStoryboard(name: "Detailpage", bundle: nil).instantiateInitialViewController() as? DetailpageViewController ?? DetailpageViewController()
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hideKeyboardWhenTapAroundView()
        showLoading()
        interactor?.getUserPostsData(.init())
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.isHidden = true
    }
}

// MARK: TableView DataSource, Delegate
extension DetailpageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailpageCell") ?? UITableViewCell()
        cell.textLabel?.text = userPosts[indexPath.row].title
        cell.detailTextLabel?.text = userPosts[indexPath.row].author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToWebpage(userPosts[indexPath.row].url)
    }
    
    private func reloadTableView() {
        tableView.isHidden = false
        tableView.reloadData()
    }
}

// MARK: DisplayLogic
extension DetailpageViewController: DetailpageDisplayLogic {
    func displayUserPostsData(_ viewModel: Detailpage.UserPosts.ViewModel){
        title = viewModel.viewTitle
        userPosts = viewModel.list
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.reloadTableView()
        }
    }
    
    func displayError(_ viewModel: Detailpage.Error.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.displayAlert(viewModel.message)
        }
    }
}

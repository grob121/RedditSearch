import UIKit
import RxSwift
import RxCocoa

protocol HomepageDisplayLogic: class {
    func displaySubredditsData(_ viewModel: Homepage.Subreddits.ViewModel)
    func displayError(_ viewModel: Homepage.Error.ViewModel)
}

class HomepageViewController: BaseViewController {
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var searchButton: UIButton!
    @IBOutlet weak private var tableView: UITableView!
    
    var interactor: HomepageBusinessLogic?
    var router: HomepageRoutingLogic?
    private let disposeBag = DisposeBag()
    private var searchText = ""
    private var subreddits = [Homepage.List]()
    
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
        let worker = HomepageWorker()
        let interactor = HomepageInteractor(worker)
        let presenter = HomepagePresenter()
        let router = HomepageRouter(self)
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    static func initFromStoryboard() -> HomepageViewController {
        return UIStoryboard(name: "Homepage", bundle: nil).instantiateInitialViewController() as? HomepageViewController ?? HomepageViewController()
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupObservables()
        hideKeyboardWhenTapAroundView()
        showLoading()
        interactor?.getSubredditsData(.init(query: ""))
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.isHidden = true
    }
}

// MARK: Rx
extension HomepageViewController {
    private func setupObservables() {
        disposeBag.insert([
            searchTextField
                .rx
                .controlEvent(.editingChanged)
                .withLatestFrom(searchTextField.rx.text.orEmpty)
                .subscribe(onNext: { [weak self] text in
                    self?.handleTypedText(text)
                }),
            
            searchButton
                .rx
                .tap
                .subscribe(onNext: { [weak self] _ in
                    self?.handleClickedSearch()
                })
        ])
    }

    private func handleTypedText(_ text: String) {
        searchText = text
    }
    
    private func handleClickedSearch() {
        tableView.isHidden = true
        showLoading()
        interactor?.getSubredditsData(.init(query: searchText))
    }
}

// MARK: TableView DataSource, Delegate
extension HomepageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subreddits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homepageCell") ?? UITableViewCell()
        cell.textLabel?.text = subreddits[indexPath.row].subreddit
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetailpage(subreddits[indexPath.row].subreddit)
    }
    
    private func reloadTableView() {
        tableView.isHidden = false
        tableView.reloadData()
    }
}

// MARK: DisplayLogic
extension HomepageViewController: HomepageDisplayLogic {
    func displaySubredditsData(_ viewModel: Homepage.Subreddits.ViewModel) {
        subreddits = viewModel.list
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.reloadTableView()
        }
    }
    
    func displayError(_ viewModel: Homepage.Error.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.displayAlert(viewModel.message)
        }
    }
}

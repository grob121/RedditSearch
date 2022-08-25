import Foundation

protocol HomepageBusinessLogic {
    func getSubredditsData(_ request: Homepage.Subreddits.Request)
}

class HomepageInteractor {
    private let APIWorker: HomepageWorkerProtocol
    var presenter: HomepagePresentationLogic?
    
    init(_ apiWorker: HomepageWorkerProtocol) {
        APIWorker = apiWorker
    }
}

extension HomepageInteractor: HomepageBusinessLogic {
    func getSubredditsData(_ request: Homepage.Subreddits.Request) {
        let requestQuery = request.query.replacingOccurrences(of: " ", with: "")
        let query = requestQuery.isEmpty ? "" : "r/\(requestQuery)"
        APIWorker.executeGetSubreddits(query: query) { [unowned self] (callback) in
            switch callback{
            case .success(let response):
                prepareSubredditsData(query: query, response: response)
            case .failure(let error):
                presenter?.presentError(.init(message: error.localizedDescription))
            }
        }
    }
    
    private func prepareSubredditsData(query: String, response: SubredditsResponse) {
        guard let data = response.data, let children = data.children, children.count != 0 else {
            presenter?.presentError(.init(message: "No Subreddits"))
            return
        }
        let list = query.isEmpty ? children.map({ Homepage.List.init(subreddit: "r/\($0.data?.subreddit ?? "")") }) : [Homepage.List.init(subreddit: "r/\(children[0].data?.subreddit ?? "")")]
        presenter?.presentSubredditsData(.init(list: list))
    }
}

import Foundation

protocol DetailpageBusinessLogic {
    func getUserPostsData(_ request: Detailpage.UserPosts.Request)
}

protocol DetailpageDataStore {
    var subreddit: String { get set }
}

class DetailpageInteractor: DetailpageDataStore {
    // DataStore
    var subreddit: String = ""
    
    private let APIWorker: DetailpageWorkerProtocol
    var presenter: DetailpagePresentationLogic?
    
    init(_ apiWorker: DetailpageWorkerProtocol){
        APIWorker = apiWorker
    }
}

extension DetailpageInteractor: DetailpageBusinessLogic {
    func getUserPostsData(_ request: Detailpage.UserPosts.Request) {
        APIWorker.executeGetSubreddits(query: subreddit) { [unowned self] (callback) in
            switch callback{
            case .success(let response):
                prepareUserPosts(response)
            case .failure(let error):
                presenter?.presentError(.init(message: error.localizedDescription))
            }
        }
    }
    
    private func prepareUserPosts(_ response: SubredditsResponse) {
        guard let data = response.data, let children = data.children, children.count != 0 else {
            presenter?.presentError(.init(message: "No User Posts"))
            return
        }
        let list = children.map({
            Detailpage.List.init(
                title: $0.data?.title ?? "",
                author: $0.data?.author ?? "",
                url: $0.data?.url ?? ""
            )
        })
        presenter?.presentUserPostsData(.init(viewTitle: subreddit, list: list))
    }
}

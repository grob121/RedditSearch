protocol HomepagePresentationLogic {
    func presentSubredditsData(_ response: Homepage.Subreddits.Response)
    func presentError(_ response: Homepage.Error.Response)
}

class HomepagePresenter: HomepagePresentationLogic {
    weak var viewController: HomepageDisplayLogic?
    
    func presentSubredditsData(_ response: Homepage.Subreddits.Response) {
        viewController?.displaySubredditsData(.init(list: response.list))
    }
    
    func presentError(_ response: Homepage.Error.Response) {
        viewController?.displayError(.init(message: response.message))
    }
}

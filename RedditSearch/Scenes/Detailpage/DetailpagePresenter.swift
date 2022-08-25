protocol DetailpagePresentationLogic {
    func presentUserPostsData(_ response: Detailpage.UserPosts.Response)
    func presentError(_ response: Detailpage.Error.Response)
}

class DetailpagePresenter: DetailpagePresentationLogic {
    weak var viewController: DetailpageDisplayLogic?
    
    func presentUserPostsData(_ response: Detailpage.UserPosts.Response) {
        viewController?.displayUserPostsData(.init(viewTitle: response.viewTitle, list: response.list))
    }
    
    func presentError(_ response: Detailpage.Error.Response) {
        viewController?.displayError(.init(message: response.message))
    }
}

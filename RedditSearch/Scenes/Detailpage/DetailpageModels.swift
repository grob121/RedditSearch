enum Detailpage {
    
    // MARK: Use cases
    enum UserPosts {
        struct Request { }
        struct Response {
            let viewTitle: String
            let list: [List]
        }
        struct ViewModel {
            let viewTitle: String
            let list: [List]
        }
    }
    
    struct List {
        let title: String
        let author: String
        let url: String
    }
    
    enum Error {
        struct Response {
            let message: String
        }
        struct ViewModel {
            let message: String
        }
    }
}

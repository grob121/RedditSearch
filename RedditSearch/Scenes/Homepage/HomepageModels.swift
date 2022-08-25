enum Homepage {
    
    // MARK: Use cases
    enum Subreddits {
        struct Request {
            let query: String
        }
        struct Response {
            let list: [List]
        }
        struct ViewModel {
            let list: [List]
        }
    }
    
    struct List {
        let subreddit: String
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

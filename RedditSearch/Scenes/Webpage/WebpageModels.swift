import UIKit

enum Webpage {
    
    // MARK: Use cases
    enum Redirect {
        struct Request { }
        struct Response {
            let url: String
        }
        struct ViewModel {
            let request: URLRequest
        }
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

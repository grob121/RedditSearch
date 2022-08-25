import Foundation
import Alamofire
import RxSwift
import ObjectMapper

protocol DetailpageWorkerProtocol {
    func executeGetSubreddits(query: String, callback: @escaping (Swift.Result<SubredditsResponse, Error>) -> Void)
}

class DetailpageWorker: DetailpageWorkerProtocol {
    func executeGetSubreddits(query: String, callback: @escaping (Swift.Result<SubredditsResponse, Error>) -> Void) {
        Alamofire.request(
            Router.baseURL + String(format: Router.Endpoints.getSubredditsEndpoint, query),
            method: .get)
            .responseJSON { response in
            switch response.result {
                case .success(_):
                    let response = Mapper<SubredditsResponse>().map(JSONObject: response.result.value)
                    callback(.success(response ?? SubredditsResponse(kind: "", data: Data())))
                case .failure(let error):
                    callback(.failure(error))
            }
        }
    }
}

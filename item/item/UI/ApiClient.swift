import UIKit

class ApiClient {
    
    class func request(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        let request = URLRequest(url: url)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(
            configuration: configuration,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            completion(data, response, error)
        })
        
        task.resume()
    }
}

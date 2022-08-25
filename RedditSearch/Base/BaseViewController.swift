import UIKit
import WebKit

class BaseViewController: UIViewController {
    private let indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            indicator.style = .gray
        }
    }
    
    func hideKeyboardWhenTapAroundView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoading() {
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hideLoading() {
        indicator.stopAnimating()
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert)
        present(
            alert,
            animated: true,
            completion: {
                Timer.scheduledTimer(
                    withTimeInterval: 1,
                    repeats: false,
                    block: { _ in
                        self.dismiss(animated: true, completion: nil)
                    }
                )
            }
        )
    }
}

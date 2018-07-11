import UIKit
import SocketIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = SocketManager(socketURL: URL(string: "http://localhost:8080/")!)
        let defaultNamespaceSocket = manager.defaultSocket
        let swiftSocket = manager.socket(forNamespace: "/swift")
        
        defaultNamespaceSocket.connect()
        swiftSocket.connect()
    }
}


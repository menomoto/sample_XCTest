import XCTest
@testable import appRanking

class TopViewControllerTests: XCTestCase {
    
    var window: UIWindow!
    var viewController: TopViewController!
    override func setUp() {

        setupViewController()
        viewController.viewDidLoad()
        
        super.setUp()
    }
    
    func test_画面タイトルが正しいこと() {
        XCTAssertEqual(viewController.navigationItem.title, "UITextField XCTest Sample Code")
    }
    
    func test_入力フィールドが表示されること() {
        XCTAssertNotNil(viewController.appRanking)
    }
    
    func test_入力フィードをタップすると入力状態になること() {
        XCTAssertFalse(viewController.appRanking.isEditing)
        viewController.appRanking.becomeFirstResponder()
        XCTAssertTrue(viewController.appRanking.isEditing)
    }


    // MARK: - Private Method
    fileprivate func setupViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        viewController = TopViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

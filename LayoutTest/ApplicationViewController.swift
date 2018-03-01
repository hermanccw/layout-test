import UIKit

class ApplicationViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    edgesForExtendedLayout = []
    let vc = ViewController()
    addChildVC(vc)
    
    // this does not work
    DispatchQueue.main.async {
      vc.data = ViewData(name: "MEMEME", count: 10)
    }
    
    // this works
//    vc.data = ViewData(name: "MEMEME", count:10)
  }
}

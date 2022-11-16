import UIKit

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with item: Item)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    private var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

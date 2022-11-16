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
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }

            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[sectionIndex].kind
            
            switch sectionKind {
            case .header:     return LayoutSectionFactory.full(with: 300)
            case .table:      return LayoutSectionFactory.full(with: 78)
            case .tomorrow:   return LayoutSectionFactory.full(with: 148)
            case .bihourly:   return LayoutSectionFactory.bihourly()
            case .tenday:     return LayoutSectionFactory.tenday()
            default:          return nil
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        layout.configuration = config
        
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        setupCollectionView()
        configureDataSource()
        setupSectionHeader()
        createCardData()
//        addBackgroundGradient()
    }
    
    func setupCollectionView() {
        let cells: [RegisterableView] = [
            .nib(TodaysForecastCellView.self),
            .nib(BihourlyCell.self),
            .nib(WeatherInfoCellView.self),
            .nib(TomorrowCellView.self),
            .nib(DailyCellView.self)
        ]
        
        collectionView.register(cells: cells)
        collectionView.register(SectionHeaderView.nib, forSupplementaryViewOfKind: SectionHeaderView.kind, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func createCardData() {
        sections = [
            Section(kind: .header, items: [Item()]),
            Section(kind: .table, items: [Item()]),
            Section(kind: .bihourly, items: [
                Item(index: 0), Item(index: 1), Item(index: 2), Item(index: 3),
                Item(index: 4), Item(index: 5), Item(index: 6), Item(index: 7),
                Item(index: 8), Item(index: 9), Item(index: 10), Item(index: 11)
            ]),
            Section(kind: .tomorrow, items: [Item()]),
            Section(kind: .table, items: [Item(titleColor: .baseLightBlue, subTitleColor: .baseDarkBlue, dividerColor: .baseLightBlue)]),
            Section(kind: .tenday, title: "10 Day Forecast", items: [
                Item(), Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item(), Item()
            ])
        ]

        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with item: Item, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }

        cell.configure(with: item)
        return cell
    }
    
    private func addBackgroundGradient() {
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = view.frame.size
        gradientLayer.colors = [UIColor.baseBlue.cgColor, UIColor.baseOffWhite.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.5, 0.65, 0.95]
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundColor = .clear
        self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return nil }

            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind

            switch sectionKind {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodaysForecastCellView.reuseIdentifier, for: indexPath)
                return cell
            case .bihourly:
                return self.configure(BihourlyCell.self, with: item, for: indexPath)
            case .table:
                return self.configure(WeatherInfoCellView.self, with: item, for: indexPath)
            case .tomorrow:
                return self.configure(TomorrowCellView.self, with: item, for: indexPath)
            case .tenday:
                return self.configure(DailyCellView.self, with: item, for: indexPath)
            default:
                return nil
            }
        }
    }
    private func setupSectionHeader() {
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else { return nil }

            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            let section = snapshot.sectionIdentifiers[indexPath.section]
            
            switch sectionKind {
            case .tenday:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                    for: indexPath) as! SectionHeaderView
                sectionHeader.configure(section.title)
                return sectionHeader
            default:
                return nil
            }
        }
    }
}

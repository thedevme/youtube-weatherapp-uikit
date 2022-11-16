import Foundation

struct Kind: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }

    static let bihourly = Kind(rawValue: Section.App.bihourly.rawValue)
    static let header = Kind(rawValue: Section.App.header.rawValue)
    static let table = Kind(rawValue: Section.App.table.rawValue)
    static let tomorrow = Kind(rawValue: Section.App.tomorrow.rawValue)
    static let tenday = Kind(rawValue: Section.App.tenday.rawValue)
}

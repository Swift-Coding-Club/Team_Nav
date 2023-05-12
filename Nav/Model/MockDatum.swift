import Foundation
import CoreLocation

// MARK: - MockDatum
struct MockDatum: Codable, Identifiable {
    let id: Int
    let title: Title
    let subject: Int
    let address: String
    let latitude, longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static let allData: [MockDatum] = Bundle.main.decode(file: "MockData.json") // 프로그램 전체에서 사용 할 수 있도록 함.
    static let sampleData: MockDatum = allData[0] // 빠른 UI 예제를 위해 1번째 데이터를 사용하도록 만듦.
}

enum Title: String, Codable {
    case dr = "Dr"
    case honorable = "Honorable"
    case mr = "Mr"
    case mrs = "Mrs"
    case ms = "Ms"
    case rev = "Rev"
}

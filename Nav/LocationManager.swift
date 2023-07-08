import SwiftUI
import Combine

class LocationManager: ObservableObject {
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
}

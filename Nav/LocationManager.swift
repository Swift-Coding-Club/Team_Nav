//
//  LocationManager.swift
//  Nav
//
//  Created by 김민택 on 2023/06/02.
//

import Combine
import Foundation
import MapKit
import SwiftUI

class LocationManager: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchQuery = ""
    var completer: MKLocalSearchCompleter
    @Published var completions: [MKLocalSearchCompletion] = []
    var cancellable: AnyCancellable?

    override init() {
        completer = MKLocalSearchCompleter()
        super.init()
        cancellable = $searchQuery.assign(to: \.queryFragment, on: self.completer)
        completer.delegate = self
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.completions = completer.results
    }

    func loadAddressCoordinate(_ address: MKLocalSearchCompletion, completoinHandler: @escaping (MKCoordinateRegion) -> Void) {
        let searchRequest = MKLocalSearch.Request(completion: address)
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard error == nil else { return }
            guard let coordinate = response?.boundingRegion.center else { return }
            guard let span = response?.boundingRegion.span else { return }

            completoinHandler(MKCoordinateRegion(center: coordinate, span: span))
        }
    }
}

extension MKLocalSearchCompletion: Identifiable {}

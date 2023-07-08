import SwiftUI
import MapKit

struct TestMapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        var parent: TestMapView

        init(_ parent: TestMapView) {
            self.parent = parent
        }

        @objc func handleTap(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                let locationInView = sender.location(in: parent.mapView)
                let tappedCoordinate = parent.mapView.convert(locationInView, toCoordinateFrom: parent.mapView)
                
                let latitude = tappedCoordinate.latitude
                let longitude = tappedCoordinate.longitude
                
                print("Tapped Latitude: \(latitude), Longitude: \(longitude)")
            }
        }
    }

    let mapView = MKMapView()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<TestMapView>) -> MKMapView {
        let tapRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(sender:)))
        tapRecognizer.delegate = context.coordinator
        mapView.addGestureRecognizer(tapRecognizer)
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<TestMapView>) {
    }
}

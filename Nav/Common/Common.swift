//
//  Common.swift
//  Nav
//
//  Created by Seulki Lee on 2023/06/08.
//

import Foundation
import SwiftUI

class AlertManager: ObservableObject {

    func showAlert(title: String, message: String) -> Alert {
          let alert = Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("확인")))
          return alert
      }
    
    func showResetAlert(title: String, message: String, resetAction: @escaping () -> Void) -> Alert {
          let alert = Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("확인"), action: resetAction), secondaryButton: .cancel(Text("취소")))
          return alert
      }
}

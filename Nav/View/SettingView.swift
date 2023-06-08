//
//  Setting.swift
//  Nav
//
//  Created by Seulki Lee on 2023/04/21.
//

import SwiftUI

struct SettingView: View {
    @StateObject private var alertManager = AlertManager()
    @State private var isApiModalPresented = false
    @State private var isVersionAlert = false
    @State private var isResetAlert = false
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    SettingButton(title: "오픈 API") {
                        self.isApiModalPresented = true
                    }
                    .sheet(isPresented: $isApiModalPresented) {
                        // 오픈 API 모달 뷰 구현
                        Text("오픈 API 모달 팝업")
                    }
                    
                    SettingButton(title: "버전 정보") {
                        self.isVersionAlert = true
                    }
                    .alert(isPresented: $isVersionAlert) {
                        alertManager.showAlert(title: "버전정보", message: "현재 버전: v1.0")
                    }
                    
                    SettingButton(title: "초기화") {
                        self.isResetAlert = true
                    }
                    .alert(isPresented: $isResetAlert) {
                        alertManager.showResetAlert(title: "초기화", message: "초기화 하시겠습니까?") {
                            // 초기화 로직 구현
                        }
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SettingButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .font(.subheadline)
        .foregroundColor(.black)
    }
}

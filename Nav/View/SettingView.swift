//
//  Setting.swift
//  Nav
//
//  Created by Seulki Lee on 2023/04/21.
//

import SwiftUI

struct SettingView: View {
    @State private var isApiModalPresented = false
    @State private var isVersionAlert = false
    @State private var isLogoutAlert = false
    @State private var isResetAlert = false
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    Button(action: {
                        self.isApiModalPresented = true
                    }) {
                        Text("오픈 API")
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .sheet(isPresented: $isApiModalPresented) {
                        // 오픈 API 모달 뷰 구현
                        Text("오픈 API 모달 팝업")
                    }
                    
                    Button(action: {
                        self.isVersionAlert = true
                    }) {
                        Text("버전 정보")
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .alert(isPresented: $isVersionAlert) {
                        Alert(title: Text("버전 정보"), message: Text("현재 버전: 1.0"), dismissButton: .default(Text("확인")))
                    }
                    
                    Button(action: {
                        self.isResetAlert = true
                    }) {
                        Text("초기화")
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .alert(isPresented: $isResetAlert) {
                        Alert(title: Text("초기화"), message: Text("초기화 하시겠습니까?"), primaryButton: .destructive(Text("초기화"), action: {
                            // 초기화 로직 구현
                        }), secondaryButton: .cancel(Text("취소")))
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


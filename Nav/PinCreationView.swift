//
//  PinCreationView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/29.
//

import SwiftUI

struct PinCreationView: View {
    @State private var locationCategory: String = "음식"
    @State private var locationName: String = ""
    @State private var locationAddress: String = ""
    @State private var locationDescription: String = ""
    
    var body: some View {
        ZStack {
            Color.primary
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.primary)
                            .padding((40 - 15) / 2)
                            .background(
                                Circle()
                                    .fill(Color.navWhite)
                            )
                    }
                    
                    Spacer()
                    
                    Text("핀 추가")
                        .headline()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Spacer()
                        .frame(width: 40)
                }
                .padding([.leading, .trailing], 16)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("테마")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text(locationCategory)
                                .body2()
                                .foregroundColor(.navBlack)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color.navGray))
                        }
                    }
                    
                    HStack {
                        Text("이름")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        VStack {
                            TextField("추가할 장소의 이름을 입력해주세요.", text: $locationName)
                            
                            Divider()
                        }
                        .padding(.leading, 16)
                    }
                    
                    HStack {
                        Text("주소")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        VStack {
                            TextField("클릭해서 주소를 변경해주세요.", text: $locationAddress)
                            
                            Divider()
                        }
                        .padding(.leading, 16)
                    }
                    
                    Group {
                        Text("사진")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.primary)
                                    .padding(40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.navGray)
                                    )
                            }
                        }
                    }
                    
                    Group {
                        Text("설명")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        TextEditor(text: $locationDescription)
                            .cornerRadius(16)
                    }
                    
                    Group {
                        Text("평점")
                            .subhead3()
                            .foregroundColor(.navBlack)
                        
                        // TODO: - 하단의 Spacer를 별점으로 변경
                        
                        Spacer()
                            .frame(width: 60, height: 60)
                    }
                    
                    Button(action: {}) {
                        Text("확인")
                            .subhead3()
                            .foregroundColor(.navWhite)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.primary)
                            )
                    }
                    .padding(.bottom, 16)
                }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.9)
                .background(Color.secondary)
                .cornerRadius(16)
                .ignoresSafeArea()
            }
        }
    }
}

struct PinCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PinCreationView()
    }
}

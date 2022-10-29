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
    @State private var rating: [Bool] = [true, true, true, false, false]
    
    var body: some View {
        NavigationView {
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
                        .padding(.top, 20)

                    HStack {
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(.primaryRed)
                                .padding(40)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.navGray)
                                )
                        }
                    }
                    .padding(.bottom, 20)
                }
                
                Group {
                    Text("설명")
                        .subhead3()
                        .foregroundColor(.navBlack)

                    TextEditor(text: $locationDescription)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.navBlack, lineWidth: 1)
                        )
                }
                
                Group {
                    Text("평점")
                        .subhead3()
                        .foregroundColor(.navBlack)
                        .padding(.top, 20)

                    // TODO: - 하단의 Spacer를 별점으로 변경
                    
                    HStack {
                        ForEach(rating, id: \.self) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .foregroundColor($0 ? .yellow : .navGray)
                        }
                    }
                    .padding(.bottom, 20)
                }
                
                Button(action: {}) {
                    Text("확인")
                        .headline()
                        .foregroundColor(.navWhite)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.primaryRed)
                        )
                }
            }
            .padding(16)
            .navigationTitle("핀 추가")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.navBlack)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
        .background(.red)
    }
}

struct PinCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PinCreationView()
    }
}

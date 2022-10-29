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
        VStack {
            HStack {
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.red)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle().fill(.white)
                        )
                }
                
                Spacer()
                
                Text("핀 추가")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Spacer()
                    .frame(width: 40)
            }
            .padding([.leading, .trailing], 16)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("테마")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text(locationCategory)
                            .padding(8)
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 16).fill(.gray))
                    }
                }
                
                HStack {
                    Text("이름")
                        .font(.system(size: 16, weight: .semibold))
                    
                    VStack {
                        TextField("추가할 장소의 이름을 입력해주세요.", text: $locationName)
                        
                        Divider()
                    }
                    .padding(.leading, 16)
                }
                
                HStack {
                    Text("주소")
                        .font(.system(size: 16, weight: .semibold))
                    
                    VStack {
                        TextField("클릭해서 주소를 변경해주세요.", text: $locationAddress)
                        
                        Divider()
                    }
                    .padding(.leading, 16)
                }
                
                Group {
                    Text("사진")
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                                .frame(width: 110, height: 110)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.gray)
                                )
                        }
                    }
                }
                
                Group {
                    Text("설명")
                        .font(.system(size: 16, weight: .semibold))
                    
                    TextEditor(text: $locationDescription)
                        .cornerRadius(16)
                }
                
                Group {
                    Text("평점")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(height: 30)
                    
                    Text("aa")
                    
                    // TODO: - 하단의 Spacer를 별점으로 변경
                    
                    Spacer()
                        .frame(width: 60, height: 60)
                }
                
                Button(action: {}) {
                    Text("확인")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(RoundedRectangle(cornerRadius: 16).fill(.red))
                }
                
                Spacer()
            }
            .padding(16)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.88)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.orange)
            )
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

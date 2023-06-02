//
//  PinCreationView.swift
//  Nav
//
//  Created by 김민택 on 2022/10/29.
//
import SwiftUI
import PhotosUI
struct PinCreationView: View {
    @State private var locationCategory: String = "음식"
    @State private var locationName: String = ""
    @State private var locationAddress: String = ""
    @State private var locationDescription: String = ""
    @State private var rating: [Bool] = [false, false, false, false, false]
    @State private var showDeleteConfirmationAlert = false
    @State private var imageToRemoveIndex: Int?
    
    @StateObject var imagePicker = ImagePicker()
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<imagePicker.images.count, id: \.self) { index in
                                imagePicker.images[index]
                                    .resizable()
                                    .scaledToFit()
                                    .overlay(
                                        Button(action: {
                                            showDeleteConfirmationAlert = true
                                            imageToRemoveIndex = index
                                        }) {
                                            Image(systemName: "minus.circle.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.red)
                                        }
                                    )
                                    .onTapGesture {
                                        showDeleteConfirmationAlert = true
                                        imageToRemoveIndex = index
                                    }
                            }
                            
                            Button(action: {
                                print(imagePicker.images.count)
                            }) {
                                PhotosPicker(selection: $imagePicker.imageSelections,
                                             maxSelectionCount: 10,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                }
                            }
                            .frame(width: 100, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.navGray)
                            )
                        }
                    }
                }
            }
            .alert(isPresented: $showDeleteConfirmationAlert) {
                Alert(
                    title: Text("사진 삭제"),
                    message: Text("정말로 사진을 삭제하시겠습니까?"),
                    primaryButton: .destructive(Text("삭제")) {
                        if let index = imageToRemoveIndex {
                            imagePicker.images.remove(at: index)
                        }
                    },
                    secondaryButton: .cancel(Text("아니오"))
                )
            }
            Group {
                HStack {
                    Text("설명")
                        .subhead3()
                        .foregroundColor(.navBlack)
                    
                    Spacer()
                }
                
                TextEditor(text: $locationDescription)
                    .frame(minHeight: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.navBlack, lineWidth: 1)
                    )
            }
            
            Group {
                HStack {
                    Text("평점")
                        .subhead3()
                        .foregroundColor(.navBlack)
                        .padding(.top, 20)
                    
                    Spacer()
                }
                
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
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}
struct PinCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PinCreationView()
    }
}

//
//  LoginView.swift
//  Nav
//
//  Created by Seulki Lee on 2022/11/01.
//
//        LinearGradient(gradient: Gradient(colors: [Color.primaryRed, Color.secondaryOrange]), startPoint: .top, endPoint: .bottom)
import SwiftUI

struct LoginView: View {
    @State private var showing = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ZStack{
                    //Splash
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [Color.primaryRed, Color.secondaryOrange]), startPoint: .top, endPoint: .bottom)
                        
                        Image("BackImg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                    }.edgesIgnoringSafeArea(.all)
                }
                
                //button
                VStack{
                    Spacer()
                    
                    //네이버
                    NavigationLink(destination: MapView()) {
                        Image("Naver")
                        
                        Text("Sign in with Naver")
                            .cornerRadius(30)
                            .foregroundColor(Color.white)
                    }.frame(width: UIScreen.main.bounds.width-20, height: 44)
                        .background(.green)
                        .cornerRadius(15)
                        .padding(2)
                        .confirmationDialog(
                            "Select",
                            isPresented: $showing,
                            actions: {
                                Button("1") { }
                                Button("2") { }
                                Button("Destruct", role: .destructive) { }
                            }
                        )
                    
                    //카카오
                    NavigationLink(destination: MapView()) {
                        Image("Kakao")
                        
                        Text("Sign in with Kakao")
                            .cornerRadius(30)
                            .foregroundColor(Color.black)
                    }.frame(width: UIScreen.main.bounds.width-20, height: 44)
                        .background(.yellow)
                        .cornerRadius(15)
                        .padding(2)
                    
                    //구글
                    NavigationLink(destination: MapView()) {
                        Image("Google")
                        
                        Text("Sign in with Goole")
                            .cornerRadius(30)
                            .foregroundColor(Color.gray)
                    }.frame(width: UIScreen.main.bounds.width-20, height: 44)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(2)
                    
                    //apple
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "applelogo")
                            .foregroundColor(Color.black)
                        
                        Text("Sign in with apple")
                            .cornerRadius(30)
                            .foregroundColor(Color.black)
                    }.frame(width: UIScreen.main.bounds.width-20, height: 44)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(2)
                    
                }
                .padding(20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

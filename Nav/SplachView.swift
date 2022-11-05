//
//  SplachView.swift
//  Nav
//
//  Created by Seulki Lee on 2022/11/02.
//

import SwiftUI

struct SplachView: View {
    var body: some View {
        VStack{
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
        }
    }
}

struct SplachView_Previews: PreviewProvider {
    static var previews: some View {
        SplachView()
    }
}

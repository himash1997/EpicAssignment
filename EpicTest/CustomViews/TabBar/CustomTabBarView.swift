//
//  CustomTabBarView.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-07.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @ObservedObject var vm = CustomTabBarVM()
    let safeAreaSize: CGFloat
    
    var body: some View {
        VStack(spacing:0){
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader{ proxy in
                        LazyHStack{
                            ForEach(self.vm.tabItems, id: \.self) { tabName in
                                Text(tabName)
                                    .tracking(1)
                                    .foregroundColor(.custom(.HEX_D6D7D9))
                                    .font(.custom(.OswaldRegular, 16))
                                    .padding(.horizontal, 20)
                                
                            }
                        }
                    }
                }
                .padding(.top, 20)
                Spacer()
            }
            .frame(height: 50)
            
            //get space from bottom for safe area
            VStack{}.frame(height: safeAreaSize)
        }
        .background(Color.custom(.HEX_252A3D))
    }
}

//
//  CastView.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-05.
//

import SwiftUI

struct CastView: View {
    
    @StateObject var vm = CastVM()
    @State private var pageCount = 0
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                
                //Background color
                Color.custom(.HEX_1D2033)
                
                //Activity indicator
                if vm.isLoading{
                    ProgressView("Locading..")
                        .progressViewStyle(CustomProgressViewStyle())
                }

                //MARK:- Title
                VStack{
                    VStack{
                        HStack{
                            Text("CAST")
                                .font(.custom(.OswaldMedium, 30))
                                .foregroundColor(.custom(.HEX_F0E3CE))
                            Spacer()
                            VStack{
                                Image(systemName: "person")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.custom(.HEX_252A3D))
                            .cornerRadius(15)
                        }
                        .padding(.top, 40)
                        .padding(.horizontal, 20)
                    }
                    
                    //MARK:- Content
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(vm.castList, id: \.charID){ cast in
                                    CastCardView(cast: cast, frameHeight: geo.size.height * 0.65, frameWidth: geo.size.width * 0.6)
                                        .padding(.horizontal, 10)
                                }
                            }
                            .padding(.leading, 10)
                            .background(GeometryReader {
                                Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self,
                                                       value: -$0.frame(in: .named("scroll")).origin.x)
                            })
                            
                        }
                        .coordinateSpace(name: "scroll")
                        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                            pageCount = Int((round(value / (geo.size.width * 0.6)) + 1))
                        }
                    }
                    
                    Spacer(minLength: 5)
                    
                    //MARK:- Paging
                    if !vm.isLoading{
                        VStack{
                            HStack(spacing: 3){
                                Text("\(pageCount)")
                                    .foregroundColor(.custom(.HEX_D6D7D9))
                                    .font(.custom(.OswaldRegular, 16))
                                Text("/")
                                    .foregroundColor(.custom(.HEX_D6D7D9))
                                    .font(.custom(.OswaldRegular, 16))
                                Text("\(vm.castList.count)")
                                    .foregroundColor(.custom(.HEX_D6D7D9))
                                    .font(.custom(.OswaldRegular, 16))
                                Spacer()
                            }
                            ZStack{
                                Rectangle()
                                    .size(width: geo.size.width * 0.5, height: 2)
                                    .foregroundColor(.custom(.HEX_6E717B))
                                
                                Rectangle()
                                    .size(width: (CGFloat(geo.size.width * 0.5 * CGFloat(pageCount)) / CGFloat(vm.castList.count)), height: 2)
                                    .foregroundColor(.custom(.HEX_D6D7D9))
                                
                            }
                            .frame(height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                    }
                    
                    //MARK:- TabBar
                    CustomTabBarView(safeAreaSize: geo.safeAreaInsets.bottom)
                    
                }
            }
            .ignoresSafeArea(edges: [.bottom, .top])
        }

    }
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView()
    }
}

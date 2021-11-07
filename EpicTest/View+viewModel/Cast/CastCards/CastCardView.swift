//
//  CastCardView.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-05.
//

import SwiftUI
import SDWebImageSwiftUI

struct CastCardView: View {
    
    let cast : Cast
    let frameHeight: CGFloat
    let frameWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            //MARK: Image
            WebImage(url: URL(string: cast.img))
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFill()
                .frame(width: frameWidth, height: frameHeight * 0.6)
                .clipped()
            
            //MARK: Info
            VStack(alignment: .leading, spacing: 0){
                
                //Name
                Text(cast.name.uppercased())
                    .tracking(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .font(.custom(.OswaldMedium, 15))
                    .foregroundColor(.custom(.HEX_483231))
                
                //Occupation
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(cast.occupation, id: \.self){ occupation in
                               Text(occupation.uppercased())
                                .font(.custom(.OswaldRegular, 13))
                                .foregroundColor(.custom(.HEX_483231))
                                
                                if occupation != cast.occupation.last{
                                    Text("|")
                                        .font(.custom(.OswaldRegular, 13))
                                        .foregroundColor(.custom(.HEX_483231))
                                }
                            }
                        }
                    }
                }
                .padding(.top, 7)
                
                //Dummy Text
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                    .font(.system(size: 12))
                    .foregroundColor(.custom(.HEX_6E717B))
                    .padding(.top, 10)
                
                Spacer()
                
                //Follow Button
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            Image(systemName: "link")
                                .foregroundColor(.black)
                        }
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.custom(.HEX_EF9E78))
                        .cornerRadius(15)
                        .shadow(radius: 15)

                    })
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 20)

            Spacer()
        }
        .frame(width: frameWidth, height: frameHeight)
        .background(Color.custom(.HEX_EBEBEB))
        .cornerRadius(20)

    }
}

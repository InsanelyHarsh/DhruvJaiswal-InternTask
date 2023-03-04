//
//  HomeView.swift
//  AffordRing
//
//  Created by Harsh Yadav on 04/03/23.
//

import SwiftUI

struct HomeView: View {
    @State var txt:String = ""
    @StateObject var homeVM:HomeViewModel = HomeViewModel()
    var body: some View {
            ZStack(alignment:.top){
                ScrollView{
                    VStack(spacing: 30){
                        
                        TextField("What you are looking for?", text: $txt)
                            .bold(true)
                            .padding(.leading,40)
                            .overlay(alignment: .leading, content: {
                                ImageUtility.search.image
                                    .padding(.leading,10)
                            })
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.5)
                                    .frame(height: 50, alignment: .center)
                                    .foregroundColor(.gray)
                            }
                        
                        
                        //MARK: - Category
                        Grid(alignment: .center, horizontalSpacing: 10, verticalSpacing: 20) {
                            ForEach(self.homeVM.categoryItem.indices) { categoryRowIdx in
                                GridRow{
//                                    Spacer()
                                    ForEach(self.homeVM.categoryItem[categoryRowIdx],id:\.id){ category in
                                        getCell(for: category)
                                    }
//                                    Spacer()
                                }
                            }
                        }
                        
                        
                        //MARK: - Use App
                        ImageUtility.useApp.image
                            .overlay(alignment: .bottomLeading){
                                VStack(alignment: .leading){
                                    Text("How to Use the App")
                                        .font(.title)
                                        .bold(true)
                                    
                                    Text("Learn how to use app")
                                        .bold(true)
                                }
                                .padding(.bottom,20)
                                .padding(.leading,20)
                                .foregroundColor(.white)
                            }
                        
                        
                        
                        VStack(alignment: .leading){
                            Text("Products Near You")
                                .font(.callout)
                            
                            Grid(alignment: .center, horizontalSpacing: 20, verticalSpacing: 15) {
                                ForEach(self.homeVM.nearByProductList.indices) { rowIdx in
                                    GridRow{
                                        ForEach(self.homeVM.nearByProductList[rowIdx],id:\.id){ product in
                                            NearYouView(item: product)
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .offset(y:60)
                    .padding(.horizontal)
                    .padding(.vertical,0)
                    
                    
                    Color(.clear)
                                  .frame(height: 150)
                }
                
                
                header
                .zIndex(1)
            }
    }
    
    @ViewBuilder
    private func getCell(for category:CategoryItem)->some View{
        VStack{
            category.categoryImage
                .cornerRadius(5)
            
            Text(category.categoryTitle)
                .font(.caption2)
                .frame(width: 80)
        }
    }
}


extension HomeView{
    //Header
    private var header:some View{
        HStack{
            ImageUtility.icon.image
                .resizable()
            .frame(width: UIScreen.main.bounds.width*0.38, height: UIScreen.main.bounds.width*0.35*0.25, alignment: .center)
            .offset(y: 0)
            
            Spacer()
            
            HStack(spacing: 13){
                ImageUtility.people.image
                
                ImageUtility.bell.image
            }
        }
        .padding(.horizontal)
        .padding(.vertical,0)
        .background(content: {
            Rectangle()
                .frame(height: 102)
                .foregroundColor(.background)
                .ignoresSafeArea()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

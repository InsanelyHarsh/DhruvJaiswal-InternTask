//
//  AffordRingApp.swift
//  AffordRing
//
//  Created by Harsh Yadav on 04/03/23.
//

import SwiftUI

@main
struct AffordRingApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack(alignment:.bottom){
                HomeView()
                    
                HStack(alignment:.bottom){
                    ForEach(Tabbar.allCases,id:\.tabTitle){ tab in
                        Spacer()
                        VStack{
                            Text(tab.tabIcon)
                            Text(tab.tabTitle)
                                .font(.caption2)
                        }
                        Spacer()
                    }
                }
                .padding(.top,5)
                .background(Color.white.ignoresSafeArea())


            }
        }
    }
}

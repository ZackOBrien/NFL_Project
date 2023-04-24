//
//  TeamView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/28/22.
//

import SwiftUI

struct TeamView: View {
    @EnvironmentObject var VM: ViewModel
    var body: some View {
        VStack{
            NavigationView{
                ScrollView{
                    ForEach(VM.teams){ t in
                        NavigationLink {
                            WebView(url_string: "\(t.website)")
                        } label: {
                            HStack{
//                                Image("\(t.logo)")
                                Image("\(t.name)")
                                    .resizable()
                                    .frame(width: 85, height: 85, alignment: .leading)
//                                    .padding(.leading)
                                Spacer()
                                Text("\(t.name)")
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
//                                    .padding(.trailing)
                            }
                            .padding()
                        }
                      
                        .frame(width: 350, height: 125)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(radius: 20)
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Teams")
            }
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
            .environmentObject(ViewModel())
            .ignoresSafeArea()
    }
}

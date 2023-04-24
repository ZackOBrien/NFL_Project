//
//  ScheduleView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/28/22.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var VM: ViewModel
    
    var body: some View {
        VStack{
            NavigationView{
                ScrollView{
                    ForEach(VM.games){ g in
                        NavigationLink {
                            MapView(stadium: g.location)
                        } label: {
                            VStack{
                                HStack{
                                    VStack{
                                        Text("\(g.awayteam.name)")
                                            .foregroundColor(.black)
                                        Image("\(g.awayteam.name)")
                                            .resizable()
                                            .frame(width: 140, height: 140, alignment: .leading)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    VStack{
                                        Text("vs")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
                                    }
                                    VStack{
                                        Text("\(g.hometeam.name)")
                                            .foregroundColor(.black)
                                        Image("\(g.hometeam.name)")
                                            .resizable()
                                            .frame(width: 140, height: 140, alignment: .leading)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                }
                                Text("\(g.date.formatted(date: .abbreviated, time: .shortened))")
                                    .foregroundColor(.black)
                                    .bold()
                            }

                        }
                        .frame(width: 350, height: 250)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 20)
                        .padding(.horizontal)
                    }
                    
                    
                }
                .navigationTitle("Schedule")
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(ViewModel())
            .ignoresSafeArea()
    }
}

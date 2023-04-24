//
//  ContentView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var VM: ViewModel
    var body: some View {
        VStack{
            TabView{
                ScheduleView()
                    .tabItem{
                        Label("Schedule", systemImage: "calendar")
                    }
                TeamView()
                    .tabItem{
                        Label("Teams", systemImage: "person.3.fill")
                    }
                CountdownView(game_one: VM.games[0])
                    .tabItem{
                        Label("Countdown", systemImage: "hourglass")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

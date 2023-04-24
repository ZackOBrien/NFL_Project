//
//  TestView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 11/2/22.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var VM: ViewModel

    var body: some View {
        VStack{
//            ForEach(VM.games){ g in
//                HStack{
//                    Text("\(g.hometeam.name)"
//                    Text("\(g.awayteam.name)")
//                }
//            }
//            ForEach(VM.stadiums){ g in
//                HStack{
//                    Text("\(g.name)")
//                    Text("\(g.latitude)")
//                }
//            }
                        ForEach(VM.stadiums){ g in
                            HStack{
                                Text("\(g.name)")
                                Text("\(g.latitude)")
                            }
                        }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ViewModel())
    }
}

//
//  CountdownView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/28/22.
//

import SwiftUI

struct CountdownView: View {
    @EnvironmentObject var VM: ViewModel
    var game_one = Game()
    
    var temp : Int{
        return Int((game_one.date.timeIntervalSince1970).rounded()) - Int((Date().timeIntervalSince1970).rounded())
    }
    //computed var to get the distance from today's date and the game date
    var secondsRemaining : Int{
        return Int((game_one.date.timeIntervalSince1970).rounded()) - Int((Date().timeIntervalSince1970).rounded())
    }
    //this tmp will be used for the count down timer
    @State var tmp : Int = 0
    let countDown = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    //calculates the seconds the hard way, the modulo wasn;t working so i elected the subtracting the amount of time taken from the previous
    var formattedString : String{
        let days = tmp / 86400 // 1/60 minute -> 1/60 hours -> days
        let hours = (tmp - days * 86400) / 3600 //subtracts the seconds for the day then calculates hours 1/60 minutes -> 1/60 hours
        let minutes = (tmp - days * 86400 - hours * 3600) / 60 // subtracts second fors days, hours. then calculates minute 1/60 minutes
        let seconds = tmp - days * 86400 - hours * 3600 - minutes * 60 //subtrcts seconds for days, hours and minutes to get the remaining seconds.
        return String(format: "Days: %.2i \n %.2i:%.2i:%.2i", days, hours, minutes, seconds)
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("\(game_one.hometeam.name)")
                    .italic()
                Text("vs")
                    .foregroundColor(.red)
                Text("\(game_one.awayteam.name)")
                    .italic()
            }
            .font(.system(size: 22))
            Text("Stadium: \(game_one.location.name)")
                .font(.system(size: 22))
                .padding(.bottom)
            Text("\(formattedString)")
                .font(.system(size: 50))
                .onAppear(perform: {
                    tmp = self.secondsRemaining
                })
                .onReceive(countDown){ _ in //this is the count down clock
                    //the function here wil execute every one second
                    tmp -= 1
                }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(game_one: Game())
            .environmentObject(ViewModel())
    }
}

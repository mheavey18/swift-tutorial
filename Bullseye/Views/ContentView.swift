//
//  ContentView.swift
//  Bullseye
//
//  Created by Marty Heavey on 3/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Float = 50
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("Put the bullseye as close as you can to 🎯")
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: self.$alertIsVisible, content: {
                var rounderSliderValue : Int = Int(self.sliderValue.rounded())
                return Alert(
                    title: Text("As long as you tried your best..."),
                    message: Text("the slider's value is " + String(rounderSliderValue) + ". You scored \(self.game.points(sliderValue: rounderSliderValue, target: self.game.target)) points this round!"),
                    dismissButton: Alert.Button.default(
                        Text("Go again!"), action: { game = Game() }
                    )
                )
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(
                .fixed(width: 568, height: 320)
            )
    }
}

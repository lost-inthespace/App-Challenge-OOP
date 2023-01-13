
//
//  ContentView.swift
//  TastyTest-Challenge APP on Swift
//
//  Created by Mohammed AlZmzmi on 10/01/2023.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State private var showText = false
    @State private var goToNameView: Bool? = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NameView(), tag: true, selection: $goToNameView)  {
                    Text("WELCOME")
                        .foregroundColor(.black)
                        .font(.system(size: 40
))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 400, height: 500)
                        .background(
                            Image("background")
                                .scaledToFill()
                        )
                }
                if showText{
                    Text("tap anywhere to continue")
                        .padding(.bottom, 75.0)
                        .animation(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/, value: 3)
                        .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                }
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 100, height: 50)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .blur(radius: 1)
                    .cornerRadius(14)
                    .overlay(
                        NavigationLink(destination: AboutView()) {
                            Text("About")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                    )
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showText = true
                }
            }

            }
        }
    }
    
    
    
struct NameView: View {
    @State private var name: String = ""
    @State private var showAlertC1 = false
    @State private var showAlertC2 = false
    @State private var nameIsValid = false
    @State private var showText = false
    
    var body: some View {
        VStack(alignment: .center) {
            if showText{
                Text("You Must Enter Valid Name To Greet")
            }
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.gray.opacity(0.3))
                .blur(radius: 1)
                .cornerRadius(8)
                .background(
                    Image("background")
                        .scaledToFit()
                        .blur(radius: 2)
                )
                .overlay(
                    TextField("Enter your name...", text: $name, onEditingChanged: {(editing) in
                        if !editing {
                            self.checkInput(name: name)
                        }
                    })
                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                )
                .padding()
                .padding()
            if nameIsValid {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 100, height: 50)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .blur(radius: 1)
                    .cornerRadius(14)
                    .overlay(
                        NavigationLink(destination: DisplayView(name: name)){
                            Text("Greet Me")
                        }
                    )
            }
            if showText{
                Text("You Must Enter Valid Name To Greet")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.showText = true
            }
        }
        .alert(isPresented: $showAlertC1) {
            Alert(title: Text("⚠️"), message: Text("Input is empty"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showAlertC2) {
            Alert(title: Text("⚠️"), message: Text("Please Enter Name Consist of Alpahbet"), dismissButton: .default(Text("OK")))
        }
    }
    
    func checkInput(name: String) {
        func isValid(_ input: String) -> Bool { let alphabet = CharacterSet.letters
            return input.rangeOfCharacter(from: alphabet) != nil
        }
        if (name.isEmpty) {
            self.showAlertC1 = true
        } else if(!isValid(name)) {
            self.showAlertC2 = true
        } else {
            nameIsValid = true
            showText = false
        }
    }
}

    struct AboutView: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color.gray.opacity(0.3))
                .blur(radius: 1)
                .cornerRadius(14)
                .frame(width: 320, height: 100)
                .overlay(
                    Text("This An App That Get Your Name And Greet It!")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                )
                .background(
                    Image("background")
                        .scaledToFit()
                        .blur(radius: 2)
                )

        }
    }
struct DisplayView: View {
    var name: String
    @State private var counter: Int = 0
    @State private var showText = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundColor(Color.gray.opacity(0.3))
            .blur(radius: 1)
            .cornerRadius(14)
            .frame(width: 320, height: 100)
            .overlay(
                Text("Nice To Meet You \(name)")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
            )
            .background(
                Image("background")
                    .scaledToFit()
                    .blur(radius: 2)
            )
            .confettiCannon(counter: $counter)
            .onAppear {
                var timer: Timer?
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    self.counter += 1
                    if self.counter == 4 {
                        timer.invalidate()
                        self.showText = true
                    }
                }
            }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }



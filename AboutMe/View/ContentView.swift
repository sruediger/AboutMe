//
//  ContentView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import SwiftUI

struct MainScreenViewModel {
    
}

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    init() {
        let appearence = UINavigationBarAppearance()
        
        appearence.configureWithTransparentBackground()
        appearence.backgroundColor = (UIColor(named: "Colors/background") ?? .clear).withAlphaComponent(0.5)
        appearence.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        
        UINavigationBar.appearance().standardAppearance = appearence
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black.opacity(0.45))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        self.createHeaderView()
                        self.createBodyView()
                            .frame(height: 120)
                            .padding(.top, 6)
                            .padding(.bottom, 6)
                        
                        self.createBottomView()
                    }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
            }
            
            .navigationTitle(
                Text("About Me")
                 //   .font(.system(.largeTitle, design: .rounded))
                 //   .foregroundColor(.white)
                 //   .fontWeight(.semibold)
                 //   .foregroundColor(.white)
            ).navigationBarTitleDisplayMode(.automatic)
            .background(Color("Colors/background").ignoresSafeArea())
        }
    }
}

extension ContentView {
    
    @ViewBuilder private func createBodyView() -> some View {
        let subviews: [MainScreenSubview] = [.languages, .technologies, .apps]
        
        HStack(spacing: 10) {
            Spacer()
            ForEach(subviews) { subview in
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        //            .foregroundColor(.black.opacity(0.45))
                    .overlay(
                        VStack(spacing: 10) {
                            Image(systemName: subview.imagePath)
                                .resizable()
                                .frame(width: 48, height: 48)
                            
                            Text("\(subview.id)")
                                .fontWeight(.semibold)
                                .font(.system(.subheadline, design: .rounded))
                        }.foregroundColor(.white)
                    )//.frame(width: 110, height: 110)
            }
            Spacer()
        }
    }
    
    @ViewBuilder private func createBottomView() -> some View {
        let subviews: [MainScreenSubview] = [.curiosities, .skills, .contact]
        
        ForEach(subviews) { subview in
            CollapsibleView {
                HStack(spacing: 10) {

                    Image(systemName: subview.imagePath)
                        .resizable()
                        .frame(width: 32, height: 32)
                    
                    Text("\(subview.id)")
                        .font(.system(.headline, design: .rounded))
                    
                }.foregroundColor(.white)
            } content: {
                Group {
                    Text("aopa")
                    Text("bão ?")
                }.foregroundColor(.white)
            }
        }
    }
    
    @ViewBuilder private func createHeaderView() -> some View {
        Group {
            /*HStack(spacing: 0) {
                Text("About Me")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Spacer()
            }
            */
            HStack(spacing: 10) {
                Image("Sergio/memojiWWDC21")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sérgio Gomes Ruediger")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text("Software engineer & iOS developer")
                        .italic()
                        .font(.subheadline)
                   //     .fontWeight(.regular)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "location.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                        
                        Text("Brasília, Brazil")
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
            }.foregroundColor(.white)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet pellentesque. Suspendisse vestibulum urna ex, tempor condimentum lorem consequat id interdum pharetra neque, ut auctor metus tincidunt at. Curabitur elementum quam risus, eu convallis tortor luctus tempus, blandit laoreet nunc sit amet consequat.")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}


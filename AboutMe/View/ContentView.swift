//
//  ContentView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor(Color("Colors/customBlack"))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("About Me")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
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
                                .font(.headline)
                                .fontWeight(.regular)
                            
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
                    
                    Text("""
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan laoreet pellentesque. Suspendisse vestibulum urna ex, tempor condimentum lorem consequat id. Nulla interdum pharetra neque, ut auctor metus tincidunt at. Curabitur elementum quam risus, eu convallis tortor luctus tempus. Nam blandit laoreet nunc sit amet consequat. Suspendisse neque arcu, viverra a consequat a, dictum non eros. Phasellus iaculis leo gravida leo rhoncus, eget dictum elit ullamcorper. Nullam eu vehicula enim, eu congue nibh.
                        """)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    
                    
           //         Text("Skills")
                    
                    
                    
                    Spacer()
                    
                }.frame(width: UIScreen.main.bounds.width - 20)
                    .padding(.top, 20)
                
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

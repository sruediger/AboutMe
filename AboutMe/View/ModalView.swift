//
//  ModalView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 01/05/22.
//

import SwiftUI

struct ModalView: View {
    @Binding var subview: MainScreenSubview?
    @State private var viewModel = ModalViewModel()
        
    var body: some View {
        if let subviewContent = subview {
            ZStack {
                Color.black.opacity(0.45).ignoresSafeArea()
                    .onTapGesture { /// Dismiss the presented modal when the background is tapped
                        self.subview = nil
                    }
                
                let windowSize = viewModel.getSizeOf(content: subview)

                BlurredRectangleView(style: .systemChromeMaterial, foregroundColor: .accentColor.opacity(0.02), cornerRadius: 28, shadowRadius: 4)
                    .overlay(
                        VStack {
                            HStack {
                                Text(subviewContent.description)
                                    .foregroundColor(.primary)
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.bold)
                                Spacer()
                                self.createButtonView()
                            }.padding(EdgeInsets(top: 18, leading: 18, bottom: 1, trailing: 18))
                                .background(.clear)
                            
                            self.createContentView()
                        }
                    ).frame(width: windowSize.width * (viewModel.deviceInPortraitMode ? 0.64 : 1), height:  windowSize.height * (viewModel.deviceInPortraitMode ? 1.48 : 1)) /// These values must be an *Source of Truth (@State, @Binding, ...)* to be dynamically updated when the orientation changes, that's why isn't encapsulated in the viewModel
            }.transition(.opacity.animation(.easeOut(duration: 0.25)))
        }else { EmptyView() }
    }
}

/// ModalView+Builders
extension ModalView {
    
    @ViewBuilder private func createContentView() -> some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: viewModel.getVScrollIndicator(from: self.subview)) {
                VStack(alignment: .leading, spacing: 10) {
                    switch self.subview {
                        case .skills: self.skillsView()
                        case .languages: HorizontalCarouselView(items: ProgrammingLanguages.allItems) { tappedLanguageIndex in
                            // - MARK: TODO Implementation
                            print("tapped \(ProgrammingLanguages.allCases[tappedLanguageIndex])")
                        }
                    case .experience: self.experienceView().padding(.leading, 12.5)
                        case .apps: self.appView()
                        case .curiosities: self.createCuriositiesView()
                        case .contact: self.contactsView()
                        default: EmptyView()
                    }
                }.padding(.bottom, 15)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }.cornerRadius(28)
        }.sheet(isPresented: $viewModel.webView.show) {
            WebView(url: viewModel.webView.contentURL)
        }
    }
    
    @ViewBuilder private func appView() -> some View {
        ForEach(0..<2) { row in
            let items: [AnimatableScroll] = (row == 0 ? Applications.authorial : Applications.collabs)
            let label: String = (row == 0 ? "Made by me" : "Collabs")
            
            Text(label)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.primary.opacity(0.6))
                .padding(.leading, 15)
            
            HorizontalCarouselView(items: items) { tappedAppIndex in
                guard let tappedItem = items[tappedAppIndex] as? WebViewRepresentable else { return }
                self.viewModel.tapped(webItem: tappedItem)
            }
        }
    }
    
    // - MARK: TODO move to it's own class
    @ViewBuilder private func contactsView() -> some View {
        HStack(spacing: 32) {
            let contacts: [AvailableContacts] = [.linkedIn, .github, .telegram]
            ForEach(contacts, id: \.self) { contact in
                Button {
                    DispatchQueue.main.async { viewModel.tapped(webItem: contact) }
                } label: {
                    VStack(alignment: .center, spacing: 5) {
                        Image(contact.imagePath)
                            .resizable()
                            .frame(width: 46, height: 46)
                        
                        Text(contact.description)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    /// Time complexity: O(nˆ2)
    @ViewBuilder private func experienceView() -> some View {
        ForEach(0..<2, id: \.self) { section in
            let sectionTitle: String = (section == 0 ? "Education" : "Professional")
            
            Text(sectionTitle)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            let sectionItems: [ExperienceItem] = (section == 0 ? ExperienceItem.getSergioEducation() : ExperienceItem.getSergioExperiences())
            
            ForEach(sectionItems) { item in
                HStack(spacing: 8) {
                    let iconWidth: CGFloat = item.imagePath.contains("laptop") ? 56 : 42
                    Image(systemName: item.imagePath)
                        .resizable()
                        .foregroundColor(.primary)
                        .frame(width: iconWidth, height: 46)
                        .padding(2)
                    
                    let smallPhone = UIScreen.main.bounds.height <= 667
                    
                    VStack(alignment: .leading, spacing: smallPhone ? 2 : 1.25) {
                        let titleFont: Font.TextStyle = smallPhone ? .subheadline : .title3
                        let contentFont: Font = smallPhone ? .footnote : .subheadline
                        
                        Text(item.name)
                            .font(.system(titleFont, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text(item.shortDescription)
                            .font(contentFont)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 5) {
                            let timeImagePath: String = (section == 0 ? "graduationcap.fill" : "calendar.badge.clock")
                            
                            Image(systemName: timeImagePath)
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 18, height: 18)
                            
                            Text(item.duration)
                                .font(contentFont)
                                .fontWeight(.medium)
                        }
                    }
                    Spacer()
                }
            }
        }
    }

    @ViewBuilder private func skillsView() -> some View {
        ForEach(0..<2) { row in
            let label: String = (row == 0 ? "Technical skills" : "Soft skills")
            
            Text(label)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.leading, 15)

            if row == 0 {
                HorizontalCarouselView(items: TechSkills.allItems) { tappedSkillIndex in
                    
                    // - MARK: TODO Implementation
                }
            }else {
                let softSkills: [String] = ["Team work", "Communication", "Problem Solving", "Organization", "Curiosity", "Creativity", "Perseverance", "Resourcefulness"]
                
                ComponentCreator.create(plainListContent: softSkills, withBulletPoint: true)
            }
        }
    }
    
    @ViewBuilder private func createCuriositiesView() -> some View {
        ComponentCreator.create(plainListContent: ["I have been studying programming since my adolescence and have learned most of the programming languages I know outside of university, some even before. ", "I made the initial version of the Secret.ly app all by myself in less than a month and a half.", "When I was a teenager I've worked in a hardware store with technical assistance and support, besides having spent some time doing freelance graphic design jobs. "], withBulletPoint: true, customFont: .callout)
            .multilineTextAlignment(.leading)
    }
    
    @ViewBuilder private func createButtonView() -> some View {
        Button(action: { self.subview = nil }) {
            Image(systemName: "x.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.secondary)
                .padding(5)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(subview: .constant(.skills))
    }
}

//
//  MoreViewContent.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import SwiftUI

struct MoreViewContent: View {
    
    @State var user: User
    
    var body: some View {
        List {
            Section {
                HStack(spacing: 8) {
                    userAvatar()
                    userInfo()
                }
            }
            
            userMenu()
            logOutButton()
        }
        .listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    func logOutButton() -> some View {
        Button {
            print("log out")
        } label: {
            Text("Log out")
        }

    }
    
    @ViewBuilder
    func userAvatar() -> some View {
        AsyncImage(url: URL(string: user.avatarUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable().scaledToFit()
            case .failure(_):
                Image(systemName: "person.crop.circle.fill")
            @unknown default:
                Image(systemName: "person.crop.circle.fill")
            }
        }
        .clipShape(Circle())
        .frame(width: 80, height: 80)
    }
    
    @ViewBuilder
    func userInfo() -> some View {
        VStack(alignment: .leading) {
            Text(user.name)
            Text(user.email)
            Text("\(user.accountType)")
        }
    }
    
    @ViewBuilder
    func userMenu() -> some View {
        switch user.accountType {
        case .admin:
            adminMenu()
        case .teacher:
            teacherMenu()
        case .assistance:
            assistanceMenu()
        case .parent:
            parentMenu()
        case .student:
            studentMenu()
        case .unknown:
            unknownMenu()
        }
    }
    
    @ViewBuilder
    func adminMenu() -> some View {
        ForEach(AdminSection.allCases, id: \.rawValue) { section in
            Section {
                ForEach(section.items, id: \.rawValue) { item in
                    NavigationLink(destination: Text(item.rawValue)) {
                        Text(item.rawValue)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func teacherMenu() -> some View {
        HStack {
            
        }
    }

    @ViewBuilder
    func assistanceMenu() -> some View {
        HStack {
            
        }
    }

    @ViewBuilder
    func parentMenu() -> some View {
        HStack {
            
        }
    }

    @ViewBuilder
    func studentMenu() -> some View {
        HStack {
            
        }
    }

    @ViewBuilder
    func unknownMenu() -> some View {
        EmptyView()
    }
}

#Preview {
    let url = "https://cdn.iconscout.com/icon/free/png-512/free-dog-icon-download-in-svg-png-gif-file-formats--animal-pet-cute-chinese-new-year-pack-festival-icons-1651762.png?f=webp&w=512"
    let user = User(name: "Son Tung", email: "dangvusontung@gmail.com", avatarUrl: url, accountType: .admin)
    return MoreViewContent(user: user)
}

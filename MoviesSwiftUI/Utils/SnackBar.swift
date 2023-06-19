//
//  SnackBar.swift
//  testingApp
//
//  Created by Venkatesham Boddula on 16/06/23.
//

import SwiftUI

struct SnackBar: View {
    var snackBarConfiguraionObject:SnackBarConfiguration
    @Binding var showingSnackBar:Bool
    var body: some View{
        Group{
            HStack(alignment: .top){
                Image(systemName: snackBarConfiguraionObject.imageName)
                    .renderingMode(.template)
                    .foregroundColor(snackBarConfiguraionObject.backgroundColor)
                VStack(alignment: .leading) {
                    Text(snackBarConfiguraionObject.title)
                        .fontWeight(.medium)
                    Text(snackBarConfiguraionObject.description)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    showingSnackBar = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }.padding()
        }
        .background(.white)
        .overlay(alignment:.leading,content: {
            Rectangle().fill(.red)
                .frame(width: 6)
        })
        .cornerRadius(8)
        .shadow(color: .gray, radius: 4,x:0,y:1)
        .padding(.horizontal,16)
    }
}

struct SnackBar_Previews: PreviewProvider {
    static var previews: some View {
        SnackBar(snackBarConfiguraionObject: SnackBarConfiguration(imageName: "xmark.circle.fill", title: "Error", description: "This is Error", backgroundColor: .red),showingSnackBar: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}


struct SnackBarConfiguration{
    var imageName:String
    var title:String
    var description:String
    var backgroundColor:Color
}

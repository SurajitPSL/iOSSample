
import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel = FavouriteViewModel()
    @Binding var presentSideMenu: Bool
    
   
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }.padding(.horizontal, 24)
            NavigationView {
                
                List {
                    ForEach(viewModel.fetchedProducts.products.sorted{$0.id! < $1.id!}, id: \.self) { item in
                        VStack (alignment: .leading){
                            HStack(alignment: .center){
                                ImageView(urlString: item.thumbnail)
                                      .scaledToFit()
                                      .frame(width: 80, height: 80)
                                      .padding(20)
                                      .background(Color.clear)
                                      .clipShape(Circle())
                                
                                VStack (alignment: .leading, spacing: 5){
                                   
                                    Text(item.title!)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                        .background(.clear)
                                    //.minimumScaleFactor(0.5)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 12))
                                    Text(String(item.description!))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.secondary)
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(2)
                                        .font(.subheadline)
                                    Spacer()
                                }//.background(.yellow)
                                .padding(.vertical, 5)
                                
                            }//.background(.green)
                            Divider()
                        }
                        
                        .listRowSeparator(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                    }
                }.listStyle(PlainListStyle())
                .navigationBarTitle(Text("My Favourites"))
            }
          
           
        }
        //
    }
}

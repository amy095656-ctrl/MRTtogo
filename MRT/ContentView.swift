import Playgrounds
import SwiftUI

struct ContentView: View {
    let placetogo = [
        MRT(line: "淡水信義線", station: "象山站", place: "象山親山步"),
        MRT(line: "板南線", station: "市政府站", place: "松山文創園區"),
        MRT(line: "松山新店線", station: "景美站", place: "景美夜市"),
        MRT(line: "文湖線", station: "動物園站", place: "台北市立動物園"),
        MRT(line: "中和新蘆線", station: "行天宮站", place: "行天宮")
    ]
    @State private var whichplacetogo = 0
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Text(placetogo[whichplacetogo].line)
            Text(placetogo[whichplacetogo].station)
            Text(placetogo[whichplacetogo].place)
            Button("今天去哪裡"){
                whichplacetogo = .random(in: placetogo.indices)
            }
        }
    }
}



#Preview {
    ContentView()
}

#Playground {

}

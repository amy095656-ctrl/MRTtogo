import AVKit
import Playgrounds
import SwiftUI

// MARK: - 全域播放器
var player: AVPlayer?

struct ContentView: View {
    let placetogo = [
        MRT(
            line: "淡水信義線",
            station: "象山站",
            place: "象山親山步道",
            placeDescription:
                "象山步道位於台北市信義區，因山形似象而得名。沿途步道設施完善，只需步行約 20 分鐘即可抵達六巨石與觀景平台，是俯瞰台北 101 全景與城市夜景的絕佳首選地點。",
            stationimageName: "Xiangshan",
            placeimageName: "象山親山步道照片",
            breakfast: "早點醒 Early Power",
            breakfastLabel: "早餐",
            breaktastDescription: "位於象山站2號出口附近，主打質感台式早餐與熱狗堡，推薦干貝醬蘿蔔糕與黑松露熱狗堡。",
            lunch: "解解渴有限公司",
            lunchLabel: "午餐",
            lunchDescription: "緊鄰象山登山口，提供阿里山野生手洗愛玉與現烤奶油餐包，是登山前後補充能量的熱門小店。",
            dinner: "實正拉麵",
            dinnerLabel: "晚餐",
            dinnerDescription: "鄰近象山公園，主打濃厚雞豚白湯與特製叉燒拉麵，登山後享用一碗熱湯拉麵極具滿足感。",
            afternoontea: "CAFE ACME 象山店",
            afternoonteaLebel: "下午茶",
            afternoonteaDescription: "純白北歐極簡風咖啡廳，大片落地窗採光極佳，推薦燕麥奶拿鐵與巴斯克蛋糕。",
            drink: "麻古茶坊 (信義莊敬店)",
            drinkLabel: "手搖飲料",
            drinkDEsription: "位於附近的莊敬路商圈，爬完山來一杯鮮果粒茶或古早味金萱，清涼又解渴。",
            nextstop: "台北 101 / 世貿站",
            nextstionDescription:
                "搭乘捷運往淡水方向僅需 1 站（步行亦可達），下山後可順遊 101 觀景台、信義商圈逛街或造訪四四南村。",
            music: "redmusic"
        ),
        MRT(
            line: "板南線",
            station: "市政府站",
            place: "松山文創園區",
            placeDescription:
                "前身為松山菸廠，保留古色古香的日治時期製菸工廠與巴洛克花園，內部結合展演空間、誠品生活與文創選品店，是台北市區最具氣質的文藝散策地標。",
            stationimageName: "Taipei City Hall",
            placeimageName: "松山文創園區照片",
            breakfast: "真芳碳烤吐司 (信義店)",
            breakfastLabel: "早餐",
            breaktastDescription: "位於忠孝東路巷內，主打古早味炭烤吐司、粉漿蛋餅與古早味紅茶，傳統風味十分道地。",
            lunch: "五之神製作所",
            lunchLabel: "午餐",
            lunchDescription: "主打超濃郁濃縮蝦湯沾麵與豚骨拉麵，是忠孝東路 553 巷內的超人氣拉麵排隊名店。",
            dinner: "大黑居酒食堂",
            dinnerLabel: "晚餐",
            dinnerDescription: "位於市民大道周邊，提供精緻日式串燒、握壽司與海鮮丼飯，非常適合晚間聚會放鬆。",
            afternoontea: "LeTAO 小樽洋菓子舖 (松菸店)",
            afternoonteaLebel: "下午茶",
            afternoonteaDescription: "來自北海道的知名甜點店，主打雙層乳酪蛋糕與現做厚鬆餅，氣氛優雅精緻。",
            drink: "約翰紅茶公司 (信義店)",
            drinkLabel: "手搖飲料",
            drinkDEsription: "主打煮濃那堤與精選產地紅茶，鮮奶茶口感香醇滑順，是手搖控的必訪名店。",
            nextstop: "忠孝敦化站",
            nextstionDescription: "搭乘板南線往頂埔方向 1 站即可抵達，離開園區後可接續逛東區商圈、選品店與風格咖啡館。",
            music: "bluemusic"
        ),
        MRT(
            line: "松山新店線",
            station: "景美站",
            place: "景美夜市",
            placeDescription:
                "位於景美捷運站旁，是台北在地人最愛的傳統夜市之一。規模雖然精小，但聚集了眾多數十年歷史的老字號小吃，傳統煙火氣息濃厚。",
            stationimageName: "Jingmei",
            placeimageName: "景美夜市照片",
            breakfast: "佳香豆漿",
            breakfastLabel: "早餐",
            breaktastDescription: "景美在地老字號早餐，主打現烤胡椒餅夾蛋、燒餅與濃郁現磨豆漿，份量紮實。",
            lunch: "景美夜市米粉湯",
            lunchLabel: "午餐",
            lunchDescription: "夜市內的傳統名店，濃郁大骨湯底米粉湯搭配現炸紅燒肉、炸豆腐與黑白切，平價美味。",
            dinner: "高雙管四神湯",
            dinnerLabel: "晚餐",
            dinnerDescription: "在地數十年經典，招牌雙層豬腸口感超紮實，搭配香噴噴油飯是內行人的標準套裝。",
            afternoontea: "景美豆花",
            afternoonteaLebel: "下午茶",
            afternoonteaDescription: "料多實在的古早味豆花，綿密豆花搭配手工芋圓與甜芋頭，甜而不膩。",
            drink: "龜記茗品 (景美店)",
            drinkLabel: "手搖飲料",
            drinkDEsription: "主打古早味茶飲，招牌紅烏鮮乳與紅柚翡翠微酸微甜，非常解膩。",
            nextstop: "公館站",
            nextstionDescription: "搭乘綠線往松山方向 2 站，可順遊台大校園、公館商圈或到寶藏嚴國際藝術村散步。",
            music: "greenmusic"
        ),
        MRT(
            line: "文湖線",
            station: "動物園站",
            place: "台北市立動物園",
            placeDescription:
                "全台規模最大的動物園，園區分為大熊貓館、企鵝館、非洲動物區等多個主題展區，自然生態豐富，非常適合親子同遊與戶外散步。",
            stationimageName: "Taipei Zoo",
            placeimageName: "台北市立動物園照片",
            breakfast: "原味優質早餐",
            breakfastLabel: "早餐",
            breaktastDescription: "位於政大周邊，主打現點現做的手工粉漿蛋餅與大份量漢堡，深受學生與在地人喜愛。",
            lunch: "呼嚕小酒館 RuRu Bistro",
            lunchLabel: "午餐",
            lunchDescription: "政大附近的陽光洋房景觀餐廳，提供義大利麵、燉飯與排餐，環境優雅放鬆。",
            dinner: "貓空四爺",
            dinnerLabel: "晚餐",
            dinnerDescription: "位於貓空山上的宮廷風景觀餐廳，主打鐵觀音茶香特色料理，邊用餐邊俯瞰台北夜景。",
            afternoontea: "Ruins Coffee Roasters 小廢墟咖啡",
            afternoonteaLebel: "下午茶",
            afternoonteaDescription: "由舊木工廠改造的極具特色工業風老屋咖啡廳，手沖咖啡與手作甜點水準極高。",
            drink: "波波溱波霸奶茶",
            drinkLabel: "手搖飲料",
            drinkDEsription: "木柵在地人推薦的傳統手搖店，波霸珍珠口感極Ｑ，奶茶香氣濃郁。",
            nextstop: "貓空站",
            nextstionDescription: "直接於捷運站旁轉乘貓空纜車直達貓空站，品嚐鐵觀音茶飲、逛茶園並賞夕陽夜景。",
            music: "nomusic"
        ),
        MRT(
            line: "中和新蘆線",
            station: "行天宮站",
            place: "行天宮",
            placeDescription:
                "主祀關聖帝君，是台北市香火最鼎盛的廟宇之一。廟宇建築莊嚴肅穆，提供收驚服務，周邊也發展出許多傳統小吃與文青巷弄咖啡廳。",
            stationimageName: "Xingtian Temple",
            placeimageName: "行天宮照片",
            breakfast: "軟食力 Soft Power (行天宮店)",
            breakfastLabel: "早餐",
            breaktastDescription: "主打台式古早味酥皮蛋餅、饅頭堡與地瓜球，裝潢帶有質感復古風格。",
            lunch: "史記正宗牛肉麵",
            lunchLabel: "午餐",
            lunchDescription: "台北老字號牛肉麵名店，主打乳白色濃郁清燉湯頭與紅燒牛肉麵，牛肉燉煮軟嫩入味。",
            dinner: "阿城鵝肉 (吉林店)",
            dinnerLabel: "晚餐",
            dinnerDescription: "榮獲米其林必比登推薦，招牌煙燻鵝肉香氣四溢，搭配鵝油拌飯與辣血旺非常過癮。",
            afternoontea: "不老客家傳統麻糬",
            afternoonteaLebel: "下午茶",
            afternoonteaDescription: "行天宮附近的超級排隊名店，麻糬顆粒巨大且餡料（花生、芝麻、芋頭）飽滿極具人氣。",
            drink: "秈 Cafe",
            drinkLabel: "手搖飲料",
            drinkDEsription: "質感獨立茶飲店家，提供優質手沖茶與特調茶飲，是走訪廟宇後放鬆的好去處。",
            nextstop: "中山站",
            nextstionDescription:
                "搭橘線至民權西路站轉紅線（約 10 分鐘），前往心中山線形公園、赤峰街探訪獨立選品店與咖啡廳。",
            music: "orangemusic"
        ),
    ]
    @State private var whichplacetogo = 0
    var body: some View {

        ZStack {
            //1. 底圖
            Rectangle()
                .frame(width: 500, height: 800)
                .foregroundColor(
                    Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255)
                )
                .ignoresSafeArea()

            //2. 捷運資訊
            VStack(spacing: 20) {
                //2-1. 捷運logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 10)

                //2-2. 捷運路線與站牌
                HStack {
                    Image(placetogo[whichplacetogo].stationimageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                        .padding(8)
                        .background(Color.white)
                        .shadow(radius: 2)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(placetogo[whichplacetogo].line)
                            .font(.title2)
                        Text(placetogo[whichplacetogo].station)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    Spacer()

                }
                .background(.white)
                .cornerRadius(20)
                .padding(.horizontal, 100)
                .padding(.vertical, -80)

                //2-3. 景點名稱和照片
                ZStack {
                    Image(placetogo[whichplacetogo].placeimageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(20)
                    Text(placetogo[whichplacetogo].place)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 150)
                        .padding(.trailing, 120)
                        .shadow(radius: 10)

                }
                //3. 周邊美食
                ScrollView {
                    VStack(spacing: 15) {

                        //3-1. 標題
                        Text("順遊周邊美食指南")
                            .font(.system(size: 25))
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)

                        //3-2. 早餐
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Text(placetogo[whichplacetogo].breakfast)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.black)

                                Text(placetogo[whichplacetogo].breakfastLabel)
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        Color(
                                            red: 252 / 255,
                                            green: 173 / 255,
                                            blue: 56 / 255
                                        )
                                    )
                                    .clipShape(Capsule())

                                Spacer()
                            }

                            Text(placetogo[whichplacetogo].breaktastDescription)
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.9))
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(22)
                        .background(
                            Color(
                                red: 252 / 255,
                                green: 249 / 255,
                                blue: 234 / 255
                            )
                        )
                        .cornerRadius(16)

                        //3-3. 午餐
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Text(placetogo[whichplacetogo].lunch)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.black)

                                Text(placetogo[whichplacetogo].lunchLabel)
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        Color(
                                            red: 151 / 255,
                                            green: 40 / 255,
                                            blue: 40 / 255
                                        )
                                    )
                                    .clipShape(Capsule())

                                Spacer()
                            }

                            Text(placetogo[whichplacetogo].lunchDescription)
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.9))
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(22)
                        .background(
                            Color(
                                red: 252 / 255,
                                green: 249 / 255,
                                blue: 234 / 255
                            )
                        )
                        .cornerRadius(16)

                        //3-3. 晚餐
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Text(placetogo[whichplacetogo].dinner)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.black)

                                Text(placetogo[whichplacetogo].dinnerLabel)
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        Color(
                                            red: 49 / 255,
                                            green: 170 / 255,
                                            blue: 169 / 255
                                        )
                                    )
                                    .clipShape(Capsule())

                                Spacer()
                            }

                            Text(placetogo[whichplacetogo].dinnerDescription)
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.9))
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(22)
                        .background(
                            Color(
                                red: 252 / 255,
                                green: 249 / 255,
                                blue: 234 / 255
                            )
                        )
                        .cornerRadius(16)

                        //3-4. 晚餐
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Text(placetogo[whichplacetogo].afternoontea)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.black)

                                Text(
                                    placetogo[whichplacetogo].afternoonteaLebel
                                )
                                .font(.system(size: 15))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 6)
                                .background(
                                    Color(
                                        red: 151 / 255,
                                        green: 168 / 255,
                                        blue: 122 / 255
                                    )
                                )
                                .clipShape(Capsule())

                                Spacer()
                            }

                            Text(
                                placetogo[whichplacetogo]
                                    .afternoonteaDescription
                            )
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.9))
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(22)
                        .background(
                            Color(
                                red: 252 / 255,
                                green: 249 / 255,
                                blue: 234 / 255
                            )
                        )
                        .cornerRadius(16)

                        //3-5. 手搖飲料
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 20) {
                                Text(placetogo[whichplacetogo].drink)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.black)

                                Text(placetogo[whichplacetogo].drinkLabel)
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        Color(
                                            red: 219 / 255,
                                            green: 149 / 255,
                                            blue: 88 / 255
                                        )
                                    )
                                    .clipShape(Capsule())

                                Spacer()
                            }

                            Text(placetogo[whichplacetogo].drinkDEsription)
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.9))
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(22)
                        .background(
                            Color(
                                red: 252 / 255,
                                green: 249 / 255,
                                blue: 234 / 255
                            )
                        )
                        .cornerRadius(16)

                    }
                    .padding(17)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 60)

                //4. 下一站推薦
                VStack(alignment: .leading, spacing: 10) {
                    //4-1. 下一站資訊
                    HStack(alignment: .bottom, spacing: 20) {
                        Text("下一站")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, -5)
                            .padding(.vertical, -5)

                        Text(placetogo[whichplacetogo].nextstop)
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)

                        Spacer()
                    }

                    Text(placetogo[whichplacetogo].nextstionDescription)
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.9))
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 70)
                    .padding(.vertical, 30)
                    .background(
                        Color(red: 45 / 255, green: 0 / 255, blue: 0 / 255)
                    )

                    .cornerRadius(10)

                }

            }

        }
        //5. 按鈕與進站音樂
        Button("MRT togo") {
            //5-1. 隨機選取索引
            whichplacetogo = Int.random(in: placetogo.indices)

            //5-2. 播放對應景點的音樂檔
            playMusic(musicName: placetogo[whichplacetogo].music)
        }
        .padding(.horizontal, 30) 
        .padding(.vertical, 12)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .font(.largeTitle)
        .tint(Color(red: 9 / 255, green: 35 / 255, blue: 40 / 255))
        .bold()
        .shadow(radius: 5)
        .padding(.bottom, 80)
    }
}

//音樂播放處理 (AVPlayer)
func playMusic(musicName: String) {
    try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
    try? AVAudioSession.sharedInstance().setActive(true)

    if let url = Bundle.main.url(forResource: musicName, withExtension: "m4a") {
        player = AVPlayer(url: url)
        player?.seek(to: .zero)
        player?.play()
    }
}

#Preview {
    ContentView()
}

#Playground {

}

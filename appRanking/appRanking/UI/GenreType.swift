//https://affiliate.itunes.apple.com/resources/documentation/genre-mapping/
enum GenreType: Int {
    case all = 0
    case business = 6000
    case weather = 6001
    case utilities = 6002
    case travel = 6003
    case sports = 6004
    case socialNetworking = 6005
    case reference = 6006
    case productivity = 6007
    case photoAndVideo = 6008
    case news = 6009
    case navigation = 6010
    case music = 6011
    case lifestyle = 6012
    case healthANdFitness = 6013
    case games = 6014
    case finance = 6015
    case entertainment = 6016
    case education = 6017
    case books = 6018
//    case shopping = 6019
    case medical = 6020
    case newsstand = 6021
    case catalog = 6022
    
    var name: String {
        switch self {
        case .all:
            return "総合"
        case .business:
            return "ビジネス"
        case .weather:
            return "天気"
        case .utilities:
            return "ユーティリティ"
        case .travel:
            return "旅行"
        case .sports:
            return "スポーツ"
        case .socialNetworking:
            return "ソーシャル・ネットワーキング"
        case .reference:
            return "辞書／辞典／その他"
        case .productivity:
            return "仕事効率化"
        case .photoAndVideo:
            return "写真／ビデオ"
        case .news:
            return "ニュース"
        case .navigation:
            return "ナビゲーション"
        case .music:
            return "ミュージック"
        case .lifestyle:
            return "ライフスタイル"
        case .healthANdFitness:
            return "ヘルスケア／フィットネス"
        case .games:
            return "ゲーム"
        case .finance:
            return "ファイナンス"
        case .entertainment:
            return "エンターテインメント"
        case .education:
            return "教育"
        case .books:
            return "ブック"
        case .medical:
            return "メディカル"
        case .newsstand:
            return "雑誌／新聞"
        case .catalog:
            return "カタログ"
        }
    }
}

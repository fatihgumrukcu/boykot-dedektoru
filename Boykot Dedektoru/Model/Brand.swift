import Foundation
import SwiftUI

struct Brand: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let image: String
    let description: String
    let detailDescription: String // Detaylı açıklama
    let alternatives: [String]
    let category: String
}

// Marka verileri
struct BrandData {
    static let categories = ["Tümü", "Gıda", "İçecek", "Temizlik", "Kozmetik", "Teknoloji"]
    
    static let brands = [
        // Gıda & İçecek
        Brand(
            name: "Coca-Cola",
            status: "BOYKOTLU",
            image: "cocacola",
            description: "İçecek",
            detailDescription: "Amerikan menşeli gazlı içecek üreticisi. Dünya çapında en büyük alkolsüz içecek üreticisidir.",
            alternatives: ["Uludağ", "Niğde Gazozu", "Çamlıca"],
            category: "İçecek"
        ),
        Brand(
            name: "Uludağ",
            status: "UYGUN",
            image: "uludag",
            description: "İçecek",
            detailDescription: "Türk menşeli gazlı içecek üreticisi. 1930'dan beri faaliyet göstermektedir.",
            alternatives: [],
            category: "İçecek"
        ),
        Brand(
            name: "Ülker",
            status: "UYGUN",
            image: "ulker",
            description: "Gıda",
            detailDescription: "Türk menşeli gıda şirketi. Bisküvi, çikolata ve şekerleme üreticisi.",
            alternatives: [],
            category: "Gıda"
        ),
        Brand(
            name: "Torku",
            status: "UYGUN",
            image: "torku",
            description: "Gıda",
            detailDescription: "Türk menşeli gıda şirketi. Bisküvi, çikolata ve şekerleme üreticisi.",
            alternatives: [],
            category: "Gıda"
        ),
        Brand(
            name: "Sütaş",
            status: "UYGUN",
            image: "sutas",
            description: "Süt Ürünleri",
            detailDescription: "Türk menşeli süt ürünleri üreticisi. 1945'ten beri faaliyet göstermektedir.",
            alternatives: [],
            category: "Gıda"
        ),
        Brand(
            name: "Kahve Dünyası",
            status: "UYGUN",
            image: "kahvedunyasi",
            description: "Kahve",
            detailDescription: "Türk menşeli kahve üreticisi. 1945'ten beri faaliyet göstermektedir.",
            alternatives: [],
            category: "Gıda"
        ),
        Brand(
            name: "Nestlé",
            status: "BOYKOTLU",
            image: "nestle",
            description: "Gıda",
            detailDescription: "İsviçreli gıda şirketi. Dünya çapında en büyük gıda şirketlerinden biridir.",
            alternatives: ["Ülker", "Torku", "Eti"],
            category: "Gıda"
        ),
        Brand(
            name: "Danone",
            status: "BOYKOTLU",
            image: "danone",
            description: "Süt Ürünleri",
            detailDescription: "Fransız gıda şirketi. Dünya çapında en büyük süt ürünleri üreticilerinden biridir.",
            alternatives: ["Sütaş", "Pınar", "SEK"],
            category: "Gıda"
        ),
        Brand(
            name: "Starbucks",
            status: "BOYKOTLU",
            image: "starbucks",
            description: "Kahve",
            detailDescription: "Amerikan menşeli kahve zinciri. Dünya çapında en büyük kahve zinciri olarak bilinir.",
            alternatives: ["Kahve Dünyası", "Gönül Kahvesi", "Bayram Efendi Osmanlı Kahvecisi"],
            category: "Gıda"
        ),
        Brand(
            name: "McDonald's",
            status: "BOYKOTLU",
            image: "mcdonalds",
            description: "Fast Food",
            detailDescription: "Amerikan menşeli fast food zinciri. Dünya çapında en büyük fast food zinciri olarak bilinir.",
            alternatives: ["Burger King", "Popeyes", "Tavuk Dünyası"],
            category: "Gıda"
        ),
        Brand(
            name: "KFC",
            status: "BOYKOTLU",
            image: "kfc",
            description: "Fast Food",
            detailDescription: "Amerikan menşeli fast food zinciri. Dünya çapında en büyük fast food zinciri olarak bilinir.",
            alternatives: ["Tavuk Dünyası", "Popeyes", "Köfteci Yusuf"],
            category: "Gıda"
        ),
        Brand(
            name: "Unilever",
            status: "BOYKOTLU",
            image: "unilever",
            description: "Tüketici Ürünleri",
            detailDescription: "İngiliz gıda şirketi. Dünya çapında en büyük tüketici ürünleri şirketlerinden biridir.",
            alternatives: ["Evyap", "Dalan", "Ülker"],
            category: "Gıda"
        ),
        Brand(
            name: "Kraft Heinz",
            status: "BOYKOTLU",
            image: "kraftheinz",
            description: "Gıda",
            detailDescription: "Amerikan gıda şirketi. Dünya çapında en büyük gıda şirketlerinden biridir.",
            alternatives: ["Pınar", "Tat", "Tamek"],
            category: "Gıda"
        ),
        Brand(
            name: "Mondelēz",
            status: "BOYKOTLU",
            image: "mondelez",
            description: "Gıda",
            detailDescription: "Hollandalı gıda şirketi. Dünya çapında en büyük gıda şirketlerinden biridir.",
            alternatives: ["Ülker", "Eti", "Torku"],
            category: "Gıda"
        ),
        Brand(
            name: "Red Bull",
            status: "BOYKOTLU",
            image: "redbull",
            description: "İçecek",
            detailDescription: "Avusturyalı içecek üreticisi. Dünya çapında en büyük enerji içecek üreticisidir.",
            alternatives: ["Burn", "Monster", "Power"],
            category: "İçecek"
        ),

        // Giyim & Moda
        Brand(
            name: "Nike",
            status: "BOYKOTLU",
            image: "nike",
            description: "Giyim",
            detailDescription: "Amerikan giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["Kinetix", "Lescon", "Jump"],
            category: "Giyim"
        ),
        Brand(
            name: "Adidas",
            status: "BOYKOTLU",
            image: "adidas",
            description: "Giyim",
            detailDescription: "Alman giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["Kinetix", "Lescon", "Jump"],
            category: "Giyim"
        ),
        Brand(
            name: "Puma",
            status: "BOYKOTLU",
            image: "puma",
            description: "Giyim",
            detailDescription: "Alman giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["Kinetix", "Lescon", "Jump"],
            category: "Giyim"
        ),
        Brand(
            name: "H&M",
            status: "BOYKOTLU",
            image: "hm",
            description: "Giyim",
            detailDescription: "İsveçli giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["LC Waikiki", "DeFacto", "Koton"],
            category: "Giyim"
        ),
        Brand(
            name: "Zara",
            status: "BOYKOTLU",
            image: "zara",
            description: "Giyim",
            detailDescription: "İspanyol giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["LC Waikiki", "DeFacto", "Koton"],
            category: "Giyim"
        ),
        Brand(
            name: "GAP",
            status: "BOYKOTLU",
            image: "gap",
            description: "Giyim",
            detailDescription: "Amerikan giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["LC Waikiki", "DeFacto", "Koton"],
            category: "Giyim"
        ),
        Brand(
            name: "Tommy Hilfiger",
            status: "BOYKOTLU",
            image: "tommy",
            description: "Giyim",
            detailDescription: "Amerikan giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["Damat Tween", "Kiğılı", "Ramsey"],
            category: "Giyim"
        ),
        Brand(
            name: "Calvin Klein",
            status: "BOYKOTLU",
            image: "calvinclein",
            description: "Giyim",
            detailDescription: "Amerikan giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: ["Dagi", "Penti", "Blackspade"],
            category: "Giyim"
        ),
        Brand(
            name: "LC Waikiki",
            status: "UYGUN",
            image: "lcwaikiki",
            description: "Giyim",
            detailDescription: "Türk giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: [],
            category: "Giyim"
        ),
        Brand(
            name: "DeFacto",
            status: "UYGUN",
            image: "defacto",
            description: "Giyim",
            detailDescription: "Türk giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: [],
            category: "Giyim"
        ),
        Brand(
            name: "Koton",
            status: "UYGUN",
            image: "koton",
            description: "Giyim",
            detailDescription: "Türk giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: [],
            category: "Giyim"
        ),
        Brand(
            name: "Kiğılı",
            status: "UYGUN",
            image: "kigili",
            description: "Giyim",
            detailDescription: "Türk giyim markası. Dünya çapında en büyük giyim markalarından biridir.",
            alternatives: [],
            category: "Giyim"
        ),

        // Kozmetik & Kişisel Bakım
        Brand(
            name: "L'Oréal",
            status: "BOYKOTLU",
            image: "loreal",
            description: "Kozmetik",
            detailDescription: "Fransız kozmetik markası. Dünya çapında en büyük kozmetik markalarından biridir.",
            alternatives: ["Flormar", "Golden Rose", "Farmasi"],
            category: "Kozmetik"
        ),
        Brand(
            name: "Estée Lauder",
            status: "BOYKOTLU",
            image: "este",
            description: "Kozmetik",
            detailDescription: "Amerikan kozmetik markası. Dünya çapında en büyük kozmetik markalarından biridir.",
            alternatives: ["Flormar", "Golden Rose", "Farmasi"],
            category: "Kozmetik"
        ),
        Brand(
            name: "Procter & Gamble",
            status: "BOYKOTLU",
            image: "pg",
            description: "Tüketici Ürünleri",
            detailDescription: "Amerikan gıda şirketi. Dünya çapında en büyük tüketici ürünleri şirketlerinden biridir.",
            alternatives: ["Evyap", "Dalan", "Beyaz Kale"],
            category: "Kozmetik"
        ),
        Brand(
            name: "Johnson & Johnson",
            status: "BOYKOTLU",
            image: "jnj",
            description: "Kişisel Bakım",
            detailDescription: "Amerikan kişisel bakım markası. Dünya çapında en büyük kişisel bakım markalarından biridir.",
            alternatives: ["Dalan", "Evyap", "Arko"],
            category: "Kozmetik"
        ),
        Brand(
            name: "Gillette",
            status: "BOYKOTLU",
            image: "gillette",
            description: "Kişisel Bakım",
            detailDescription: "Amerikan kişisel bakım markası. Dünya çapında en büyük kişisel bakım markalarından biridir.",
            alternatives: ["Derby", "Permatik", "Rapira"],
            category: "Kozmetik"
        ),
        Brand(
            name: "Flormar",
            status: "UYGUN",
            image: "flormar",
            description: "Kozmetik",
            detailDescription: "İspanyol kozmetik markası. Dünya çapında en büyük kozmetik markalarından biridir.",
            alternatives: [],
            category: "Kozmetik"
        ),
        Brand(
            name: "Farmasi",
            status: "UYGUN",
            image: "farmasi",
            description: "Kozmetik",
            detailDescription: "Türk kozmetik markası. Dünya çapında en büyük kozmetik markalarından biridir.",
            alternatives: [],
            category: "Kozmetik"
        ),
        Brand(
            name: "Dalan",
            status: "UYGUN",
            image: "dalan",
            description: "Kişisel Bakım",
            detailDescription: "Türk kişisel bakım markası. Dünya çapında en büyük kişisel bakım markalarından biridir.",
            alternatives: [],
            category: "Kozmetik"
        ),

        // Temizlik Ürünleri
        Brand(
            name: "Ariel",
            status: "BOYKOTLU",
            image: "ariel",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: ["Bingo", "Alo", "Persil"],
            category: "Temizlik"
        ),
        Brand(
            name: "Fairy",
            status: "BOYKOTLU",
            image: "fairy",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: ["Bingo", "Alo", "Persil"],
            category: "Temizlik"
        ),
        Brand(
            name: "Domestos",
            status: "BOYKOTLU",
            image: "domestos",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: ["Viking", "Bingo", "Hypo"],
            category: "Temizlik"
        ),
        Brand(
            name: "Cif",
            status: "BOYKOTLU",
            image: "cif",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: ["Pronto", "Bingo", "Viking"],
            category: "Temizlik"
        ),
        Brand(
            name: "Bingo",
            status: "UYGUN",
            image: "bingo",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: [],
            category: "Temizlik"
        ),
        Brand(
            name: "Viking",
            status: "UYGUN",
            image: "viking",
            description: "Temizlik",
            detailDescription: "İsveçli temizlik ürünleri markası. Dünya çapında en büyük temizlik ürünleri markalarından biridir.",
            alternatives: [],
            category: "Temizlik"
        ),

        // Teknoloji & Elektronik
        Brand(
            name: "Apple",
            status: "BOYKOTLU",
            image: "apple",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. Dünya çapında en büyük teknoloji şirketlerinden biridir.",
            alternatives: ["Samsung", "Xiaomi", "Huawei"],
            category: "Teknoloji"
        ),
        Brand(
            name: "HP",
            status: "BOYKOTLU",
            image: "hp",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. Bilgisayar ve yazıcı üretiminde dünya lideri.",
            alternatives: ["Casper", "Monster", "Lenovo"],
            category: "Teknoloji"
        ),
        Brand(
            name: "Intel",
            status: "BOYKOTLU",
            image: "intel",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. İşlemci üretiminde dünya lideri.",
            alternatives: ["AMD", "MediaTek", "Qualcomm"],
            category: "Teknoloji"
        ),
        Brand(
            name: "Microsoft",
            status: "BOYKOTLU",
            image: "microsoft",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. Yazılım ve işletim sistemi üretiminde dünya lideri.",
            alternatives: ["Linux", "macOS", "Ubuntu"],
            category: "Teknoloji"
        ),
        Brand(
            name: "Dell",
            status: "BOYKOTLU",
            image: "dell",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. Bilgisayar üretiminde dünya lideri.",
            alternatives: ["Casper", "Monster", "Lenovo"],
            category: "Teknoloji"
        ),
        Brand(
            name: "IBM",
            status: "BOYKOTLU",
            image: "ibm",
            description: "Teknoloji",
            detailDescription: "Amerikan teknoloji şirketi. Kurumsal yazılım ve donanım çözümlerinde dünya lideri.",
            alternatives: ["Huawei", "Oracle", "SAP"],
            category: "Teknoloji"
        ),
        Brand(
            name: "Casper",
            status: "UYGUN",
            image: "casper",
            description: "Teknoloji",
            detailDescription: "Türk teknoloji şirketi. Bilgisayar ve mobil cihaz üreticisi.",
            alternatives: [],
            category: "Teknoloji"
        ),
        Brand(
            name: "Monster",
            status: "UYGUN",
            image: "monster",
            description: "Teknoloji",
            detailDescription: "Türk teknoloji şirketi. Oyun bilgisayarları üretiminde öncü.",
            alternatives: [],
            category: "Teknoloji"
        ),
        
        // E-Ticaret & Marketler
        Brand(
            name: "Amazon",
            status: "BOYKOTLU",
            image: "amazon",
            description: "E-Ticaret",
            detailDescription: "Amerikan e-ticaret şirketi. Dünya çapında en büyük online alışveriş platformu.",
            alternatives: ["Trendyol", "Hepsiburada", "N11"],
            category: "E-Ticaret"
        ),
        
        // Eğlence & Medya
        Brand(
            name: "Netflix",
            status: "BOYKOTLU",
            image: "netflix",
            description: "Medya",
            detailDescription: "Amerikan medya şirketi. Dünya çapında en büyük dijital yayın platformu.",
            alternatives: ["BluTV", "Gain", "Exxen"],
            category: "Medya"
        ),
        
        // Bankacılık & Finans
        Brand(
            name: "HSBC",
            status: "BOYKOTLU",
            image: "hsbc",
            description: "Finans",
            detailDescription: "İngiliz bankacılık şirketi. Dünya çapında en büyük bankalardan biri.",
            alternatives: ["Ziraat Bankası", "Vakıfbank", "Halkbank"],
            category: "Finans"
        ),
        
        // Petrol & Enerji
        Brand(
            name: "Shell",
            status: "BOYKOTLU",
            image: "shell",
            description: "Petrol",
            detailDescription: "Hollandalı petrol şirketi. Dünya çapında en büyük petrol şirketlerinden biri.",
            alternatives: ["Opet", "Petrol Ofisi", "Aytemiz"],
            category: "Petrol"
        )
    ]
} 

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let brands: [Brand]
}

// Kategori verileri
struct CategoryData {
    static let categories = [
        Category(
            name: "Gıda & İçecek",
            icon: "cup.and.saucer.fill",
            color: Color(red: 0.8, green: 0.4, blue: 0.2),
            brands: BrandData.brands.filter { brand in
                ["Coca-Cola", "Pepsi", "Nestlé", "Danone", "Starbucks", "McDonald's", "KFC", 
                 "Unilever", "Kraft Heinz", "Mondelēz", "Red Bull",
                 "Uludağ", "Ülker", "Torku", "Sütaş", "Kahve Dünyası"].contains(brand.name)
            }
        ),
        Category(
            name: "Giyim & Moda",
            icon: "tshirt.fill",
            color: Color(red: 0.4, green: 0.6, blue: 0.8),
            brands: BrandData.brands.filter { brand in
                ["Nike", "Adidas", "Puma", "H&M", "Zara", "GAP", "Tommy Hilfiger", "Calvin Klein",
                 "LC Waikiki", "DeFacto", "Koton", "Kiğılı"].contains(brand.name)
            }
        ),
        Category(
            name: "Kozmetik & Kişisel Bakım",
            icon: "sparkles",
            color: Color(red: 0.8, green: 0.3, blue: 0.6),
            brands: BrandData.brands.filter { brand in
                ["L'Oréal", "Estée Lauder", "Procter & Gamble", "Johnson & Johnson", "Gillette",
                 "Flormar", "Farmasi", "Dalan"].contains(brand.name)
            }
        ),
        Category(
            name: "Temizlik Ürünleri",
            icon: "sparkles.square.fill.on.square",
            color: Color(red: 0.2, green: 0.7, blue: 0.8),
            brands: BrandData.brands.filter { brand in
                ["Ariel", "Fairy", "Domestos", "Cif",
                 "Bingo", "Viking"].contains(brand.name)
            }
        ),
        Category(
            name: "Teknoloji & Elektronik",
            icon: "laptopcomputer",
            color: Color(red: 0.3, green: 0.3, blue: 0.8),
            brands: BrandData.brands.filter { brand in
                ["Apple", "HP", "Intel", "Microsoft", "Dell", "IBM",
                 "Casper", "Monster"].contains(brand.name)
            }
        ),
        Category(
            name: "E-Ticaret & Marketler",
            icon: "cart.fill",
            color: Color(red: 0.6, green: 0.8, blue: 0.3),
            brands: BrandData.brands.filter { brand in
                ["Amazon"].contains(brand.name)
            }
        ),
        Category(
            name: "Eğlence & Medya",
            icon: "play.tv.fill",
            color: Color(red: 0.8, green: 0.3, blue: 0.3),
            brands: BrandData.brands.filter { brand in
                ["Netflix"].contains(brand.name)
            }
        ),
        Category(
            name: "Bankacılık & Finans",
            icon: "creditcard.fill",
            color: Color(red: 0.5, green: 0.8, blue: 0.5),
            brands: BrandData.brands.filter { brand in
                ["HSBC"].contains(brand.name)
            }
        ),
        Category(
            name: "Petrol & Enerji",
            icon: "fuelpump.fill",
            color: Color(red: 0.7, green: 0.5, blue: 0.2),
            brands: BrandData.brands.filter { brand in
                ["Shell"].contains(brand.name)
            }
        )
    ]
} 
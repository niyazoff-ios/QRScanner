import Foundation

struct Products {
    static var hamburgersList: [Product] {
        let hamburger1 = Product(name: "Блю Чиз Бургер", icon: "b1", description: "Котлета из мраморной  говядины, огурцы, помидоры, соус", price: 1350)
        let hamburger2 = Product(name: "Гамбургер", icon: "b2", description: "Kотлета из мраморной говядины, огурцы, помидоры, острый соус", price: 1250)
        let hamburger3 = Product(name: "Чизбургер", icon: "b3", description: "Kотлета из мраморной говядины, сыр, огурцы, помидоры", price: 1500)
        let hamburger4 = Product(name: "Бургер куриный", icon: "b4", description: "Kотлета из курицы, огурцы, помидоры, соус", price: 1200)
        let hamburger5 = Product(name: "Бургер грибной", icon: "b5", description: "Kотлета, грибы, зелень, огурцы, помидоры, соус", price: 1350)
        let hamburger6 = Product(name: "Бургер с беконом", icon: "b6", description: "Бекон, огурцы, помидоры, соус, кетчуп", price: 1500)
        let hamburger7 = Product(name: "BBQ Burger", icon: "b7", description: "Cочная котлета,  огурцы, помидоры, острый соус bqq", price: 1250)
        let hamburger8 = Product(name: "Egg Burger", icon: "b8", description: "Яйцо жареное, колбаса, сыр, перец чили", price: 850)
        let hamburger9 = Product(name: "XXL Burger", icon: "b9", description: "Kотлета из мраморной говядины, огурцы, помидоры, соус", price: 1100)
        let hamburger10 = Product(name: "Бургер классический", icon: "b10", description: "Kотлета, огурцы, зелень, помидоры, соус", price: 1800)
        
        return [hamburger1, hamburger2, hamburger3, hamburger4, hamburger5, hamburger6, hamburger7, hamburger8, hamburger9, hamburger10]
    }
}

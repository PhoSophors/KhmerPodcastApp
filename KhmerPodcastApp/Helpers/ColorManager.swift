import UIKit

class ColorManager {
    static let shared = ColorManager()

    private init() {}

    func Blue() -> UIColor {
        return UIColor(hex: "#1F41BB")
    }
  
    func White() -> UIColor {
        return UIColor(hex: "#FEFBF3")
    }

    func DUSTYROSE() -> UIColor {
        return UIColor(hex: "#FSFODF")
    }

    // Add more color methods as needed
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

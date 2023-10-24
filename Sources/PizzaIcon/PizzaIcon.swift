import SFSafeSymbols
import UIKit

public struct PizzaIcon {

    public enum Representation {
        case sfSymbol(SFSymbol)
        case image(UIImage)
    }
    public enum Background {
        /// Прозрачный
        case transparent
        /// Foreground цвет, но с альфой (1 - foreground цвет, 0 - прозрачный)
        case dimmedForeground(alpha: CGFloat)
        /// Цветной
        case colored(UIColor)
    }
    public enum ShapeRoundedSquareRoundType {
        case fixed(CGFloat)
        /// На сколько умножать высоту, чтобы получить cornerRadius (0.5 - круг)
        case percentage(CGFloat)
    }
    public enum Shape {
        case square
        case circle
        case roundedSquare(ShapeRoundedSquareRoundType)
    }
    public enum Foreground {
        case oneColor(UIColor)
        case hierarchical(UIColor)
        case palette([UIColor])

        public var color: UIColor? {
            switch self {
            case .oneColor(let color):
                return color
            case .hierarchical(let color):
                return color
            case .palette:
                return nil
            }
        }
    }
    public struct Size {
        public let pointSize: CGFloat
        public let iconPercentage: CGFloat

        var iconPointSize: CGFloat {
            pointSize * iconPercentage
        }

        public init(pointSize: CGFloat, iconPercentage: CGFloat) {
            self.pointSize = pointSize
            self.iconPercentage = iconPercentage
        }
    }
    public enum StylePreset {
        case listColoredBGWhiteFG
        case listDimmedBGColoredFG
        case listTransparentBGColoredFG
        case teaserDimmedBGColoredLarge
        case teaserDimmedBGColoredSmall
        case teaserTransparentLarge
        case teaserTransparentSmall
    }

    public let representation: Representation?
    private(set) public var background: Background = .transparent
    private(set) public var shape: Shape = .square
    private(set) public var foreground: Foreground = .oneColor(.tintColor)
    private(set) public var size: Size = .init(pointSize: 29, iconPercentage: 0.55)

    public init(sfSymbol: SFSymbol) {
        self.representation = .sfSymbol(sfSymbol)
    }

    public init?(sfSymbolRaw: String) {
        guard UIImage(systemName: sfSymbolRaw) != nil else {
            return nil
        }
        self.representation = .sfSymbol(SFSymbol(rawValue: sfSymbolRaw))
    }

    public init(image: UIImage) {
        self.representation = .image(image)
    }

    public init() {
        self.representation = nil
    }

    @discardableResult
    public func apply(preset: StylePreset, color: UIColor) -> PizzaIcon {
        var new = self

        switch preset {
        case .listColoredBGWhiteFG:
            new.background = .colored(color)
            new.shape = .roundedSquare(.percentage(0.23))
            new.foreground = .oneColor(.white)
            new.size = .init(pointSize: 29, iconPercentage: 0.55)
        case .listDimmedBGColoredFG:
            new.background = .dimmedForeground(alpha: 0.2)
            new.shape = .roundedSquare(.percentage(0.23))
            new.foreground = .oneColor(color)
            new.size = .init(pointSize: 29, iconPercentage: 0.55)
        case .listTransparentBGColoredFG:
            new.background = .transparent
            new.shape = .square
            new.foreground = .oneColor(color)
            new.size = .init(pointSize: 29, iconPercentage: 0.76)
        case .teaserDimmedBGColoredLarge:
            new.background = .dimmedForeground(alpha: 0.2)
            new.shape = .roundedSquare(.percentage(0.23))
            new.foreground = .oneColor(color)
            new.size = .init(pointSize: 100, iconPercentage: 0.55)
        case .teaserDimmedBGColoredSmall:
            new.background = .dimmedForeground(alpha: 0.2)
            new.shape = .roundedSquare(.percentage(0.23))
            new.foreground = .oneColor(color)
            new.size = .init(pointSize: 70, iconPercentage: 0.55)
        case .teaserTransparentLarge:
            new.background = .transparent
            new.shape = .square
            new.foreground = .hierarchical(color)
            new.size = .init(pointSize: 100, iconPercentage: 0.7)
        case .teaserTransparentSmall:
            new.background = .transparent
            new.shape = .square
            new.foreground = .hierarchical(color)
            new.size = .init(pointSize: 70, iconPercentage: 0.7)
        }

        return new
    }

    @discardableResult
    public func background(_ background: Background) -> PizzaIcon {
        var new = self
        new.background = background
        return new
    }

    @discardableResult
    public func shape(_ shape: Shape) -> PizzaIcon {
        var new = self
        new.shape = shape
        return new
    }

    @discardableResult
    public func foreground(_ foreground: Foreground) -> PizzaIcon {
        var new = self
        new.foreground = foreground
        return new
    }

    @discardableResult
    public func size(_ size: Size) -> PizzaIcon {
        var new = self
        new.size = size
        return new
    }

}

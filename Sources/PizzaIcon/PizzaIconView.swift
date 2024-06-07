import SFSafeSymbols
import UIKit
import SnapKit
import SwiftUI

private class PizzaIconBackgroundView: UIView {

    var shape: PizzaIcon.Shape? {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    var background: PizzaIcon.Background? {
        didSet {
            updateColors()
        }
    }
    var foregroundColor: UIColor? {
        didSet {
            updateColors()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
        updateColors()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        switch shape {
        case .square, .none:
            layer.cornerRadius = 0
        case .circle:
            layer.cornerRadius = bounds.height / 2
        case .roundedSquare(let shapeRoundedSquareRoundType):
            switch shapeRoundedSquareRoundType {
            case .fixed(let fixed):
                layer.cornerRadius = fixed
            case .percentage(let percentage):
                layer.cornerRadius = bounds.height * percentage
            }
        }
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        updateColors()
    }

    private func updateColors() {
        switch background {
        case .transparent, .none:
            backgroundColor = .clear
            alpha = 1
        case .dimmedForeground(let alpha):
            backgroundColor = foregroundColor
            self.alpha = alpha
        case .colored(let color):
            backgroundColor = color
            alpha = 1
        }
    }

}

public struct PizzaSUIIconView: View {

    public let icon: PizzaIcon
    public let shouldBounce: Bool

    public init(icon: PizzaIcon, shouldBounce: Bool) {
        self.icon = icon
        self.shouldBounce = shouldBounce
    }

    public var body: some View {
        _PizzaSUIIconView(
            icon: icon,
            shouldBounce: shouldBounce
        ).frame(
            width: icon.size.pointSize,
            height: icon.size.pointSize
        )
    }

}

struct _PizzaSUIIconView: UIViewRepresentable {

    let icon: PizzaIcon
    let shouldBounce: Bool

    init(icon: PizzaIcon, shouldBounce: Bool) {
        self.icon = icon
        self.shouldBounce = shouldBounce
    }

    func makeUIView(context: Context) -> PizzaIconView {
        PizzaIconView()
    }

    func updateUIView(_ uiView: PizzaIconView, context: Context) {
        uiView.configure(icon: icon, shouldBounce: shouldBounce)
    }

}

public class PizzaIconView: UIView {

    private let imageView = UIImageView()
    private let backgroundView = PizzaIconBackgroundView()
    private var imageViewConstraint: Constraint?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Public Methods

    private func commonInit() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview().priority(.high)
        }

        backgroundView.snp.makeConstraints { make in
            make.width.equalTo(backgroundView.snp.height)
        }

        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.trailing.bottom.lessThanOrEqualToSuperview()
                .priority(.high)
            make.center.equalToSuperview()
            make.width.equalTo(imageView.snp.height)
            imageViewConstraint = make.width.equalTo(10).constraint
        }

        self.snp.makeConstraints { make in
            make.width.equalTo(10)
        }
    }

    public func configure(icon: PizzaIcon, shouldBounce: Bool) {
        imageViewConstraint?.update(offset: icon.size.iconPointSize)
        
        switch icon.representation {
        case .image(let image):
            imageView.image = image
            imageView.tintColor = icon.foreground.color
            imageView.isHidden = false
        case .sfSymbol(let symbol):
            imageView.image = UIImage(
                systemSymbol: symbol,
                withConfiguration: {
                    var conf: UIImage.SymbolConfiguration?

                    func applyOrCreate(other: UIImage.SymbolConfiguration) {
                        if conf == nil {
                            conf = other
                        } else {
                            conf = conf?.applying(other)
                        }
                    }

                    applyOrCreate(
                        other: UIImage.SymbolConfiguration(pointSize: icon.size.iconPointSize)
                    )

                    if case .hierarchical(let color) = icon.foreground {
                        applyOrCreate(
                            other: UIImage.SymbolConfiguration(
                                hierarchicalColor: color
                            )
                        )
                    }

                    if case .palette(let colors) = icon.foreground {
                        applyOrCreate(
                            other: UIImage.SymbolConfiguration(
                                paletteColors: colors
                            )
                        )
                    }

                    return conf
                }()
            )
            imageView.tintColor = icon.foreground.color
            imageView.isHidden = false
        case .none:
            imageView.isHidden = true
        }

        backgroundView.shape = icon.shape
        backgroundView.background = icon.background
        backgroundView.foregroundColor = icon.foreground.color
        self.snp.updateConstraints { make in
            make.width.equalTo(icon.size.pointSize)
        }

        if #available(iOS 17.0, *) {
            if shouldBounce {
                imageView.addSymbolEffect(.bounce.up.byLayer)
                onTap(completion: { [weak self] in
                    self?.imageView.addSymbolEffect(.bounce.up.byLayer)
                })
            } else {
                imageView.removeAllSymbolEffects()
                onTap(completion: nil)
            }
        } else {
            onTap(completion: nil)
        }
    }

}

extension UIView {

    func onTap(completion: (() -> Void)?) {
        let tapRecogniser = ClickListener(
            target: self,
            action: #selector(onViewClicked(sender:))
        )
        tapRecogniser.onClick = completion
        isUserInteractionEnabled = completion != nil
        if let old = gestureRecognizers?.first(where: { $0 is ClickListener }) {
            self.removeGestureRecognizer(old)
        }
        self.addGestureRecognizer(tapRecogniser)
    }

    @objc
    private func onViewClicked(sender: ClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }

}

fileprivate class ClickListener: UITapGestureRecognizer {
    var onClick : (() -> Void)? = nil
}

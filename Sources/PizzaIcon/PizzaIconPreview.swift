import SwiftUI
import UIKit
import SFSafeSymbols

struct PizzaSUIIconView_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 80) {
            HStack(alignment: .bottom, spacing: 50) {
                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape)
                            .apply(
                                preset: .teaserDimmedBGColoredLarge,
                                color: .tintColor
                            ),
                        shouldBounce: true
                    )

                    Text(".teaserDimmedBGColoredLarge")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {
                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape2)
                            .apply(
                                preset: .teaserDimmedBGColoredSmall,
                                color: .tintColor
                            ),
                        shouldBounce: true
                    )

                    Text(".teaserDimmedBGColoredSmall")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {
                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshapeFill)
                            .apply(
                                preset: .teaserTransparentLarge,
                                color: .tintColor
                            ),
                        shouldBounce: true
                    )

                    Text(".teaserTransparentLarge")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {
                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape2Fill)
                            .apply(
                                preset: .teaserTransparentSmall,
                                color: .tintColor
                            ),
                        shouldBounce: true
                    )

                    Text(".teaserTransparentSmall")
                        .font(.system(size: 13))
                }



            }

            HStack(alignment: .bottom, spacing: 50) {
                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .apply(
                                preset: .listColoredBGWhiteFG,
                                color: .systemRed
                            ),
                        shouldBounce: true
                    )

                    Text(".listColoredBGWhiteFG")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .paintbrush)
                            .apply(
                                preset: .listDimmedBGColoredFG,
                                color: .systemOrange
                            ),
                        shouldBounce: true
                    )

                    Text(".listDimmedBGColoredFG")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .handRaisedFill)
                            .apply(
                                preset: .listTransparentBGColoredFG,
                                color: .tintColor
                            ),
                        shouldBounce: true
                    )

                    Text(".listTransparentBGColoredFG")
                        .font(.system(size: 13))
                }
            }

            HStack(alignment: .bottom, spacing: 50) {
                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape)
                            .foreground(.oneColor(.tintColor))
                            .background(.dimmedForeground(alpha: 0.2))
                            .shape(.roundedSquare(.percentage(0.23))),
                        shouldBounce: true
                    )

                    Text(".dimmedForeground")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape)
                            .foreground(.oneColor(.tintColor))
                            .background(.transparent)
                            .shape(.roundedSquare(.percentage(0.23))),
                        shouldBounce: true
                    )

                    Text(".transparent")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .gearshape)
                            .foreground(.oneColor(.white))
                            .background(.colored(.tintColor))
                            .shape(.roundedSquare(.percentage(0.23))),
                        shouldBounce: true
                    )

                    Text(".colored")
                        .font(.system(size: 13))
                }
            }

            HStack(alignment: .bottom, spacing: 50) {
                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.oneColor(.white))
                            .background(.colored(.tintColor))
                            .shape(.circle),
                        shouldBounce: true
                    )

                    Text(".circle")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.oneColor(.white))
                            .background(.colored(.tintColor))
                            .shape(.square),
                        shouldBounce: true
                    )

                    Text(".square")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.oneColor(.white))
                            .background(.colored(.tintColor))
                            .shape(.roundedSquare(.fixed(10))),
                        shouldBounce: true
                    )

                    Text(".roundedSquare(.fixed(10))")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.oneColor(.white))
                            .background(.colored(.tintColor))
                            .shape(.roundedSquare(.percentage(0.23))),
                        shouldBounce: true
                    )

                    Text(".roundedSquare(.percentage(0.23))")
                        .font(.system(size: 13))
                }
            }

            HStack(alignment: .bottom, spacing: 50) {
                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.oneColor(.tintColor))
                            .size(.init(pointSize: 40, iconPercentage: 0.7)),
                        shouldBounce: true
                    )

                    Text(".oneColor")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.hierarchical(.tintColor))
                            .size(.init(pointSize: 40, iconPercentage: 0.7)),
                        shouldBounce: true
                    )

                    Text(".hierarchical")
                        .font(.system(size: 13))
                }

                VStack(spacing: 20) {

                    PizzaSUIIconView(
                        icon: PizzaIcon(sfSymbol: .appBadge)
                            .foreground(.palette([.systemRed, .tintColor]))
                            .size(.init(pointSize: 40, iconPercentage: 0.7)),
                        shouldBounce: true
                    )

                    Text(".palette")
                        .font(.system(size: 13))
                }
            }
        }.tint(.green)
    }
}

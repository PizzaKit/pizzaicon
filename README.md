# PizzaIcon

![Logo](Resources/logo.png)

Reusable views for working with icons.

## Examples

### Presets
Teaser presets - for using in empty/error views.
![Preset teaser](Resources/preset_teaser.png)

List presets - for use in lists (for ex. UITableView)
![Preset list](Resources/preset_list.png)

### Customization

Background
![Background](Resources/background.png)

Foreground
![Foreground](Resources/foreground.png)

Shape
![Shape](Resources/shape.png)

## Installation

### SPM

```swift
dependencies: [
    .package(url: "https://github.com/PizzaKit/pizzaicon", .upToNextMajor(from: "1.0.0"))
]
```

## How to use

Use `PizzaIconView` for `UIKit` or `PizzaSUIIconView` for `SwiftUI`.

### shouldBounce
Flag indicating if icon should bounce on appearance and on user's tap (animation available in iOS 17+).

### Preset
```swift
PizzaSUIIconView(
    icon: PizzaIcon(sfSymbol: .gearshape)
        .apply(
            preset: .teaserDimmedBGColoredLarge,
            color: .tintColor
        ),
    shouldBounce: true
)
```
### Custom

```swift
PizzaSUIIconView(
    icon: PizzaIcon(sfSymbol: .gearshape)
        .foreground(.oneColor(.white))
        .background(.colored(.tintColor))
        .shape(.roundedSquare(.percentage(0.23))),
    shouldBounce: true
)
```

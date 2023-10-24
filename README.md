# PizzaIcon

![Logo](Resources/logo.png)

Reusable views for working with icons.

## Examples

### Presets
Teaser presets - for using in empty/error views.

<img src="Resources/preset_teaser.png" width=600>

List presets - for use in lists (for ex. UITableView)

<img src="Resources/preset_list.png" width=400>

### Customization

Background

<img src="Resources/background.png" width=400>

Foreground

<img src="Resources/foreground.png" width=300>

Shape

<img src="Resources/shape.png" width=500>

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

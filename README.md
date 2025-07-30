
## Getting Started

The starting point of any Flutter app I build is the `main` method. Inside that method, I call another function, `runApp`, and I pass it a widget called `MyApp`. This widget becomes the root of my entire widget tree.

---

```
MyApp
└── MaterialApp
    └── HomePage
        └── Scaffold
            ├── AppBar
            │   ├── Title: Text("Malleable")
            │   ├── Leading: GestureDetector
            │   │   └── Container
            │   │       └── SvgPicture.asset('arrow-small-left-solid.svg')
            │   └── Actions: [GestureDetector]
            │       └── Container
            │           └── SvgPicture.asset('adjustments-horizontal.svg')
            └── Body: Padding
                └── Row
                    ├── Expanded (Card 1)
                    │   └── Card
                    │       └── Padding
                    │           └── Column
                    │               ├── Image.asset('card1.png')
                    │               ├── SizedBox(height: 8)
                    │               ├── Text('Common Button')
                    │               ├── SizedBox(height: 4)
                    │               └── Text('Clickable block...')
                    ├── SizedBox(width: 16)
                    └── Expanded (Card 2)
                        └── Card
                            └── Padding
                                └── Column
                                    ├── Image.asset('card2.png')
                                    ├── SizedBox(height: 8)
                                    ├── Text('FloatingActionButton')
                                    ├── SizedBox(height: 4)
                                    └── Text('Clickable button...')
```

---

I’ve learned that there are two main types of widgets in Flutter: **stateless** and **stateful**. A stateless widget can’t change or update itself once it’s built. On the other hand, a stateful widget can rebuild itself when its state changes.

---

To set up multiple pages, I create a new folder inside `lib`—usually named something like `pages`—and then I make a new file, say `home.dart`. For each new page I make, I always start by importing Material UI:

```dart
import 'package:flutter/material.dart';
````

I can quickly create a stateless widget using the `stl` snippet. For example:

```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

Over here the `Widget` can return *any* widget, meaning in later stages when I return a `Scaffold` I can do so because `Widget` is universal and applies to every widget. Yes technically typing `Scaffold` and returning `Scaffold` might work but is not recommended as when I want to change it to some other widget.

---

Once I’ve set up the `HomePage`, I go back to `main.dart` and clean out all the extra code, keeping only the `MyApp` class. Inside it, I specify the default page to load like this:

```dart
home: HomePage(),
```

Next, I use `const` in front of `MaterialApp` when the values are known at compile time and won’t change:

```dart
return const MaterialApp(
```

To get rid of the debug ribbon at the top right, I set the `debugShowCheckedModeBanner` to `false`:

```dart
debugShowCheckedModeBanner: false,
```

---

Now I go back to `home.dart` and look at the `build` method. This method defines what part of the UI the widget should render. Since the return type is also a widget, I can return any widget from it.

Instead of a `Placeholder`, I return a `Scaffold`, which gives me basic layout features like `AppBar`, `Drawer`, `FloatingActionButton`, etc. It fills the whole screen.

```dart
return Scaffold(
  appBar: AppBar(),
);
```

---

### Custom Fonts

Now I want to customize the font. I downloaded a font from Google Fonts, placed it in a new folder named `fonts` in the root directory (outside `lib`), and added the font files there. But just putting them there isn’t enough. I have to define them in `pubspec.yaml`.

I scroll down to the `fonts` section, uncomment it, and add the following:

```yaml
fonts:
  - family: Roboto
    fonts:
      - asset: fonts/Roboto-Bold.ttf
      - asset: fonts/Roboto-Medium.ttf
      - asset: fonts/Roboto-Regular.ttf
      - asset: fonts/Roboto-SemiBold.ttf
```

Even after doing this, the font won’t be recognized until I run this command in the terminal:

```bash
flutter pub get
```

Once I get the message “Process finished successfully”, I know it worked.

To apply the font across the entire app, I go back to `main.dart`, open the `ThemeData` property inside `MaterialApp`, and set the font like this:

```dart
theme: ThemeData(fontFamily: 'Roboto'),
```

I remove the `const` from `MaterialApp` and instead place it next to `HomePage()`. That way, the app can apply the theme dynamically, and only the `HomePage` remains immutable:

```dart
home: const HomePage(),
```

---

### AppBar Customization

Next, I return to the `HomePage` widget and customize the `AppBar`. I add a title using the `Text` widget and center it with the `centerTitle` property:

```dart
appBar: AppBar(
  title: Text('Malleable'),
  centerTitle: true,
),
```

To style the title text, I use the `style` property with `TextStyle`:

```dart
style: TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 25,
),
```

---

### SVG Icons

Now I want to use SVG icons in the `AppBar`, so I need to add the `flutter_svg` package. I go to pub.dev, search for the package, copy the latest version, and add it under `dependencies` in `pubspec.yaml`. Then I run `flutter pub get` again.

For the back icon on the left side, I use the `leading` property. Since I want it to be a styled icon inside a container, I wrap it like this:

```dart
leading: Container(
  margin: EdgeInsets.all(10),
  alignment: Alignment.center,
  child: SvgPicture.asset(
    'assets/icons/arrow-small-left-solid.svg',
    height: 25,
    width: 25,
  ),
  decoration: BoxDecoration(
    color: Color(0xf2f6f6f6),
    borderRadius: BorderRadius.circular(10),
  ),
),
```

To make it tappable, I wrap the whole thing in a `GestureDetector`:

```dart
leading: GestureDetector(
  onTap: () {},
  child: Container(
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    child: SvgPicture.asset(
      'assets/icons/arrow-small-left-solid.svg',
      height: 25,
      width: 25,
    ),
    decoration: BoxDecoration(
      color: Color(0xf2f6f6f6),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
),
```

For the right side of the `AppBar`, I use the `actions` property, which takes a list of widgets. I reuse the same kind of container for symmetry:

```dart
actions: [
  GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.all(10),
      width: 33,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/icons/adjustments-horizontal.svg',
        height: 25,
        width: 25,
      ),
      decoration: BoxDecoration(
        color: Color(0xf2f6f6f6),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
],
```

To clean things up further, I use the yellow light bulb (the quick‑fix in most IDEs like VS Code or Android Studio) on the `appBar:` property and extract the entire `AppBar` into a separate method with a custom name. This is explained further up top as how `Scaffold` can take direct inline Widget code or use a method for reusability.

---

### Body Content & Layout

For now the next step is to add some body content. To do this I can type the `body` property and feed it a method from the get‑go instead of first writing an inline Widget and then turning it into a method. This is what it looks like:

```dart
body: buildBody(),
```

Next to work on `body` I will put some basic cards inside of a `Row` which work on the principles of `crossAxisAlignment` and `mainAxisAlignment`. Cross axis alignment works on vertical alignment and Main axis alignment works on horizontal alignment. But in a `Column` the alignment of Cross and Main are switched.

Starting off I write the method `buildBody` to return a widget that being `Padding` adds space outside a widget’s boundary. I need space inside or outside a widget. It adds space inside the parent and around the child widget.

```dart
Widget buildBody() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        buildCard(
          'assets/images/card1.png',
          'Common Button',
          'Clickable block to start a action.',
        ),
        const SizedBox(width: 16),
        buildCard(
          'assets/images/card2.png',
          'FloatingActionButton',
          'Clickable button with a image',
        ),
      ],
    ),
  );
}
```

`Row` is a child of `Padding`, and `buildCard` is a child of `Row`. The `buildCard` for now looks like a method which it is but a child/children does not expect a method but a widget. This is fixed because this `buildCard` returns a widget and since it is called twice, it will return two widgets.

```dart
Expanded buildCard(String image, String heading, String desc) {
  return Expanded(
    child: Card(
      child: Padding(
        child: Column(
          children: [ /* ... */ ]
        )
      )
    )
  );
}
```

`Expanded` works like `Flex`, filling available space among widgets in row/column.

---

#### Complete `buildCard`

```dart
Expanded buildCard(String image, String heading, String desc) {
  return Expanded(
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              heading,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
```

* **`elevation`** adds a shadow to a widget to give it a sense of depth.
* **`mainAxisSize`** tells how much horizontal space a `Row` or `Column` uses along its axis. With `.min` to use as much space as the content itself, and `.max` to use all the available space.
* **Shape** is used to change the physical shape of a widget apart from `Container` which uses `decoration`.
* **`SizedBox`** is used to add fixed space with `width` and `height` around a widget; it acts like an invisible box. As opposed to padding, `SizedBox` adds fixed space as an actual widget.

```text
Padding

[   RED   ][BLUE]
  <-20px->

SizedBox

[RED][20px empty space][BLUE]
```


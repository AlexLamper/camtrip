import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/widgets.dart';

/// Photos for the onboarding visuals: real CC0 holiday shots, processed with
/// CamTrip's own camera styles (see assets/images/onboarding/LICENSES.md).
class OnboardingPhotos {
  OnboardingPhotos._();
  static const _dir = 'assets/images/onboarding';

  static const beach = '$_dir/s1_beach.jpg';
  static const campfire = '$_dir/s1_campfire.jpg';
  static const friends = '$_dir/s1_friends.jpg';

  static const parasols = '$_dir/s2_parasols.jpg';
  static const walk = '$_dir/s2_walk.jpg';
  static const dunes = '$_dir/s2_dunes.jpg';
  static const hiker = '$_dir/s2_hiker.jpg';
  static const concert = '$_dir/s2_concert.jpg';
  static const alley = '$_dir/s2_alley.jpg';

  static const sunset = '$_dir/s3_sunset.jpg';
  static const roadtrip = '$_dir/s3_roadtrip.jpg';
  static const alps = '$_dir/s3_mountains.jpg';
  static const windy = '$_dir/s3_beach.jpg';
  static const summit = '$_dir/s3_summit.jpg';
  static const crowd = '$_dir/s3_crowd.jpg';

  static const all = [beach, campfire, friends, parasols, walk, dunes, hiker, concert, alley, sunset, roadtrip, alps, windy, summit, crowd];
}

/// One onboarding slide: the visual takes all remaining space and scales
/// down to fit, the text block below always gets its natural height (and
/// scrolls instead of overflowing on tiny screens with very large text).
class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({super.key, required this.index, required this.title, required this.body, this.header});

  final int index;
  final String title;
  final String body;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            child: ExcludeSemantics(child: OnboardingVisual(index: index)),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: c.maxHeight * 0.85),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(28, 10, 28, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              if (header != null) ...[header!, const SizedBox(height: 8)],
              Text(title, style: CT.title(30)),
              const SizedBox(height: 10),
              Text(body, style: CT.text(16, color: const Color(0xFF555550))),
            ]),
          ),
        ),
      ]);
    });
  }
}

/// The illustration of a slide, drawn on a fixed canvas and scaled to fit
/// whatever space is left, so it never pushes the text around.
class OnboardingVisual extends StatelessWidget {
  const OnboardingVisual({super.key, required this.index});
  final int index;

  static const canvas = Size(340, 340);

  @override
  Widget build(BuildContext context) {
    final visual = switch (index) {
      0 => const _GroupRoll(),
      1 => const _LiveGallery(),
      _ => const _Recap(),
    };
    // sits a little low, close to the text, when there is room to spare
    return Align(
      alignment: const Alignment(0, 0.55),
      child: FittedBox(
        fit: BoxFit.contain,
        child: MediaQuery.withNoTextScaling(
          // decorative labels inside the drawing scale with the drawing itself
          child: SizedBox.fromSize(size: canvas, child: visual),
        ),
      ),
    );
  }
}

Widget _photo(String asset) => Image.asset(asset, fit: BoxFit.cover, gaplessPlayback: true);

bool _still(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// Plays [builder] from 0 to 1 once when the slide first appears.
class _Intro extends StatelessWidget {
  const _Intro({required this.builder, this.duration = const Duration(milliseconds: 650), this.curve = Curves.easeOutBack});
  final Widget Function(BuildContext context, double t) builder;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    if (_still(context)) return builder(context, 1);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: curve,
      builder: (context, t, _) => builder(context, t),
    );
  }
}

class _Caption extends StatelessWidget {
  const _Caption(this.initial, this.name, this.color, {this.end = false});
  final String initial;
  final String name;
  final Color color;
  final bool end;
  static const size = 15.0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: end ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
      Avatar(initial: initial, color: color, size: size, border: CT.paper),
      const SizedBox(width: 5),
      Flexible(
        child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(size * 0.7, color: CT.muted, weight: FontWeight.w500, height: 1)),
      ),
    ]);
  }
}

const _sanne = Color(0xFFD9472B);
const _milan = Color(0xFF2F7F8F);
const _noor = Color(0xFFE09A2C);

/// Slide 1: three prints from three people, fanned out like one shared roll.
class _GroupRoll extends StatelessWidget {
  const _GroupRoll();

  @override
  Widget build(BuildContext context) {
    Widget card(String asset, String initial, String name, Color color, {bool end = false}) => InstantPrint(
          aspectRatio: 0.8,
          padding: 7,
          bottom: 30,
          caption: Padding(padding: const EdgeInsets.symmetric(horizontal: 3), child: _Caption(initial, name, color, end: end)),
          child: _photo(asset),
        );

    return _Intro(
      curve: Curves.easeOutCubic,
      builder: (context, t) {
        // prints fan out from one stack
        Widget at(double dx, double dy, double deg, Widget child) => Positioned(
              left: 170 - 80 + dx * t,
              top: 28 + dy * t,
              width: 160,
              child: Transform.rotate(angle: deg * t * 3.14159 / 180, child: child),
            );
        return Stack(clipBehavior: Clip.none, children: [
          at(-88, 18, -10, card(OnboardingPhotos.campfire, 'M', 'Milan', _milan)),
          at(88, 14, 9, card(OnboardingPhotos.friends, 'N', 'Noor', _noor, end: true)),
          at(0, -8, -1.5, card(OnboardingPhotos.beach, 'S', 'Sanne', _sanne)),
          Positioned(
            left: 10,
            right: 10,
            top: 298,
            child: Center(
              child: Opacity(
                opacity: t.clamp(0, 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(20), boxShadow: CT.cardShadow),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.camera_roll_outlined, size: 15, color: CT.accent),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Mallorca '26", style: CT.text(12, weight: FontWeight.w600, height: 1)),
                          TextSpan(text: '  ·  3 fotografen, 1 rolletje', style: CT.text(12, color: CT.muted, height: 1)),
                        ]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }
}

/// Slide 2: the shared album on a phone, with a new print popping in.
class _LiveGallery extends StatelessWidget {
  const _LiveGallery();

  static const _grid = [
    OnboardingPhotos.beach,
    OnboardingPhotos.parasols,
    OnboardingPhotos.campfire,
    OnboardingPhotos.dunes,
    OnboardingPhotos.hiker,
    OnboardingPhotos.concert,
    OnboardingPhotos.alley,
    OnboardingPhotos.friends,
  ];

  @override
  Widget build(BuildContext context) {
    const tile = (196 - 12 - 24 - 2 * 6) / 3; // phone width - bezel - padding - gaps
    return Stack(clipBehavior: Clip.none, children: [
      // phone
      Positioned(
        left: 8,
        top: 4,
        width: 196,
        height: 332,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: CT.ink,
            borderRadius: BorderRadius.circular(34),
            boxShadow: const [BoxShadow(color: Color(0x26000000), blurRadius: 18, offset: Offset(0, 6))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              color: CT.bg,
              padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text("Mallorca '26", maxLines: 1, style: CT.title(15))),
                  const _Dots(),
                ]),
                const SizedBox(height: 3),
                Text('6 leden  ·  128 foto\'s', style: CT.text(9.5, color: CT.muted, height: 1.2)),
                const SizedBox(height: 10),
                Wrap(spacing: 6, runSpacing: 8, children: [
                  for (var i = 0; i < 9; i++)
                    SizedBox(
                      width: tile,
                      child: i < _grid.length
                          ? InstantPrint(rotation: tiltFor('g$i', max: 2), padding: 2.5, bottom: 8, child: _photo(_grid[i]))
                          : _Intro(
                              duration: const Duration(milliseconds: 500),
                              builder: (context, t) => Opacity(
                                opacity: t.clamp(0, 1),
                                child: Transform.scale(
                                  scale: 0.6 + 0.4 * t,
                                  child: InstantPrint(rotation: 1.5, padding: 2.5, bottom: 8, child: _photo(OnboardingPhotos.walk)),
                                ),
                              ),
                            ),
                    ),
                ]),
                const Spacer(),
                Center(
                  child: Container(
                    width: 38,
                    height: 38,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: CT.ink, width: 2.5)),
                    child: const DecoratedBox(decoration: BoxDecoration(color: CT.ink, shape: BoxShape.circle)),
                  ),
                ),
                const SizedBox(height: 12),
              ]),
            ),
          ),
        ),
      ),
      // the new print, popping in
      Positioned(
        left: 176,
        top: 62,
        width: 154,
        child: _Intro(
          duration: const Duration(milliseconds: 750),
          builder: (context, t) => Opacity(
            opacity: t.clamp(0, 1),
            child: Transform.translate(
              offset: Offset(0, 24 * (1 - t)),
              child: Transform.scale(
                scale: 0.7 + 0.3 * t,
                child: InstantPrint(
                  rotation: 6,
                  bottom: 30,
                  caption: const _Caption('M', 'Milan  ·  nu', _milan),
                  child: _photo(OnboardingPhotos.walk),
                ),
              ),
            ),
          ),
        ),
      ),
      // "new" badge
      Positioned(
        left: 274,
        top: 46,
        child: _Intro(
          duration: const Duration(milliseconds: 900),
          curve: Curves.elasticOut,
          builder: (context, t) => Transform.scale(
            scale: t.clamp(0, 1.4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(12), boxShadow: CT.cardShadow),
              child: Text('Nieuw', style: CT.text(11, color: Colors.white, weight: FontWeight.w700, height: 1)),
            ),
          ),
        ),
      ),
    ]);
  }
}

class _Dots extends StatelessWidget {
  const _Dots();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 46,
      height: 18,
      child: Stack(children: [
        Positioned(left: 0, child: Avatar(initial: 'S', color: _sanne, size: 18, border: CT.bg)),
        Positioned(left: 13, child: Avatar(initial: 'M', color: _milan, size: 18, border: CT.bg)),
        Positioned(left: 26, child: Avatar(initial: 'N', color: _noor, size: 18, border: CT.bg)),
      ]),
    );
  }
}

/// Slide 3: a filmstrip of the trip and the recap video it turns into.
class _Recap extends StatelessWidget {
  const _Recap();

  static const _frames = [
    OnboardingPhotos.roadtrip,
    OnboardingPhotos.alps,
    OnboardingPhotos.windy,
    OnboardingPhotos.summit,
    OnboardingPhotos.crowd,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        left: -6,
        top: 22,
        width: 352,
        height: 112,
        child: Transform.rotate(angle: -0.06, child: const _FilmStrip(_frames)),
      ),
      Positioned(
        left: 36,
        top: 128,
        width: 268,
        height: 196,
        child: _Intro(
          curve: Curves.easeOutCubic,
          builder: (context, t) => Opacity(
            opacity: t.clamp(0, 1),
            child: Transform.translate(offset: Offset(0, 18 * (1 - t)), child: const _VideoCard()),
          ),
        ),
      ),
    ]);
  }
}

class _FilmStrip extends StatelessWidget {
  const _FilmStrip(this.frames);
  final List<String> frames;

  @override
  Widget build(BuildContext context) {
    const frameH = 76.0;
    const frameW = frameH * 4 / 3;
    Widget holes() => Row(children: [
          for (var i = 0; i < 26; i++)
            Container(
              width: 7,
              height: 6,
              margin: const EdgeInsets.only(right: 7),
              decoration: BoxDecoration(color: CT.bg, borderRadius: BorderRadius.circular(1.5)),
            ),
        ]);
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF26231F), borderRadius: BorderRadius.circular(3), boxShadow: CT.printShadow),
      clipBehavior: Clip.hardEdge,
      child: OverflowBox(
        alignment: Alignment.centerLeft,
        maxWidth: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            holes(),
            const SizedBox(height: 10),
            Row(children: [
              for (final f in frames)
                Container(
                  width: frameW,
                  height: frameH,
                  margin: const EdgeInsets.only(right: 8),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.5)),
                  child: _photo(f),
                ),
            ]),
            const SizedBox(height: 10),
            holes(),
          ]),
        ),
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CT.paper,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Color(0x2B000000), blurRadius: 20, offset: Offset(0, 8))],
      ),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Stack(fit: StackFit.expand, children: [
          _photo(OnboardingPhotos.sunset),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Color(0x00000000), Color(0xA6000000)],
                stops: [0, 0.45, 1],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(color: Color(0xF2FFFFFF), shape: BoxShape.circle),
              child: const Icon(Icons.play_arrow_rounded, color: CT.accent, size: 30),
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 11,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Recap Mallorca '26", maxLines: 1, style: CT.title(14, color: Colors.white)),
              const SizedBox(height: 3),
              Row(children: [
                const Icon(Icons.music_note_rounded, size: 12, color: Colors.white70),
                const SizedBox(width: 3),
                Flexible(
                  child: Text('Golden hour  ·  0:45',
                      maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(10, color: Colors.white70, height: 1)),
                ),
              ]),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: const LinearProgressIndicator(
                  value: 0.36,
                  minHeight: 3,
                  backgroundColor: Color(0x55FFFFFF),
                  color: CT.accent,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

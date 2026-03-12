import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/minecraft_button.dart';

class LinksPage extends StatefulWidget {
  final String vowel;

  const LinksPage({super.key, required this.vowel});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  final FlutterTts flutterTts = FlutterTts();

  static const _consonants = [
    'n', 's', 'l', 'r', 'm'
  ];

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await flutterTts.setLanguage("es-Mx");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lowerVowel = widget.vowel.toLowerCase();

    final List<String> links =
        _consonants.map((c) => '$lowerVowel$c').toList();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background-lava.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 16,
                child: MinecraftButton.wood(
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        _buildGrid(links),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 24,
                right: 24,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC6C6C6).withValues(alpha: 0.8),
                        border: Border.all(
                          color: const Color(0xFF555555),
                          width: 3,
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => _speak(
                                'Selecciona la silaba para escuchar su pronunciación'),
                            child: Image.asset(
                              'lib/assets/images/bocina.png',
                              height: 50,
                            ),
                          ),
                          const SizedBox(width: 0),
                          Expanded(
                            child: Text(
                              'Selecciona la silaba para escuchar su pronunciación',
                              style: GoogleFonts.pixelifySans(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: Image.asset(
                        'lib/assets/images/letrero.png',
                        height: 170,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(List<String> links) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: links.length,
      itemBuilder: (context, index) {
        final link = links[index];
        return MinecraftButton.diamond(
          onPressed: () => _speak(link.toLowerCase()),
          child: Text(
            link,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      },
    );
  }
}

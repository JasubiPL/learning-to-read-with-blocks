import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/minecraft_button.dart';

class SyllablesPage extends StatefulWidget {
  final String consonant;

  const SyllablesPage({super.key, required this.consonant});

  @override
  State<SyllablesPage> createState() => _SyllablesPageState();
}

class _SyllablesPageState extends State<SyllablesPage> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await flutterTts.setLanguage("es-ES");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
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
    final vowels = ['a', 'e', 'i', 'o', 'u'];
    final upperConsonant = widget.consonant.toUpperCase();
    final lowerConsonant = widget.consonant.toLowerCase();

    final List<String> upperSyllables = vowels
        .map((v) => '$upperConsonant$v')
        .toList();
    final List<String> lowerSyllables = vowels
        .map((v) => '$lowerConsonant$v')
        .toList();

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
              // Back button
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

              // Syllables grid
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Upper case row 1 (3 items)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: upperSyllables
                            .take(3)
                            .map((s) => _buildSyllableButton(s))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      // Upper case row 2 (2 items)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: upperSyllables
                            .skip(3)
                            .map((s) => _buildSyllableButton(s))
                            .toList(),
                      ),
                      const SizedBox(height: 40),
                      // Lower case row 1 (3 items)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: lowerSyllables
                            .take(3)
                            .map((s) => _buildSyllableButton(s))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      // Lower case row 2 (2 items)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: lowerSyllables
                            .skip(3)
                            .map((s) => _buildSyllableButton(s))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom info panel with sign
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
                        color: const Color(
                          0xFFC6C6C6,
                        ).withValues(alpha: 0.8), // Light grey text box
                        border: Border.all(
                          color: const Color(0xFF555555),
                          width: 3,
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                _speak('Selecciona la sílaba para escucharla'),
                            child: Image.asset(
                              'lib/assets/images/bocina.png',
                              height: 50,
                            ),
                          ),
                          const SizedBox(width: 0),
                          Expanded(
                            child: Text(
                              'Selecciona la sílaba para escucharla',
                              style: GoogleFonts.pixelifySans(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50), // Space for the sign image
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

  Widget _buildSyllableButton(String syllable) {
    return MinecraftButton.diamond(
      width: 70,
      height: 70,
      onPressed: () => _speak(syllable),
      child: Text(
        syllable,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

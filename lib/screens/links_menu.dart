import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/minecraft_button.dart';
import 'links_page.dart';

class LinksMenuPage extends StatefulWidget {
  const LinksMenuPage({super.key});

  @override
  State<LinksMenuPage> createState() => _LinksMenuPageState();
}

class _LinksMenuPageState extends State<LinksMenuPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await flutterTts.setLanguage("es-Mx");
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background-ice.png'),
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
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC6C6C6),
                          border: Border(
                            top: const BorderSide(color: Colors.white, width: 4),
                            left:
                                const BorderSide(color: Colors.white, width: 4),
                            bottom: const BorderSide(
                              color: Color(0xFF555555),
                              width: 4,
                            ),
                            right: const BorderSide(
                              color: Color(0xFF555555),
                              width: 4,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _speak(
                                    'Selecciona la vocal para escuchar su pronunciación con una constante',
                                  ),
                                  child: Image.asset(
                                    'lib/assets/images/bocina.png',
                                    height: 50,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Selecciona la vocal\npara escuchar su pronunciación con una constante',
                                    style: GoogleFonts.pixelifySans(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: vowels.map((vowel) {
                              return SizedBox(
                                width: 56,
                                height: 56,
                                child: MinecraftButton.stone(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LinksPage(vowel: vowel),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    vowel,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: -300,
                      child: Image.asset(
                        'lib/assets/images/Piñeyrin-1.png',
                        height: 220,
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
}

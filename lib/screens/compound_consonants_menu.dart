import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/minecraft_button.dart';
import 'syllables_page.dart';

class CompoundConsonantsMenuPage extends StatefulWidget {
  const CompoundConsonantsMenuPage({super.key});

  @override
  State<CompoundConsonantsMenuPage> createState() =>
      _CompoundConsonantsMenuPageState();
}

class _CompoundConsonantsMenuPageState
    extends State<CompoundConsonantsMenuPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<String> compoundConsonants = [
    'Bl',
    'Br',
    'Cl',
    'Cr',
    'Dr',
    'Fl',
    'Fr',
    'Gl',
    'Gr',
    'Pl',
    'Pr',
    'Tr',
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
                    Container(
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
                                  'Selecciona la consonante compuesta que quieres aprender',
                                ),
                                child: Image.asset(
                                  'lib/assets/images/bocina.png',
                                  height: 50,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Selecciona la consonante\ncompuesta que quieres aprender',
                                  style: GoogleFonts.pixelifySans(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                            itemCount: compoundConsonants.length,
                            itemBuilder: (context, index) {
                              final pair = compoundConsonants[index];
                              return MinecraftButton.stone(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SyllablesPage(
                                        consonant: pair,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  '${pair[0]}${pair[1].toLowerCase()}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: -200,
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

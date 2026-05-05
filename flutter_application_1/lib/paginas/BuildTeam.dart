import 'package:flutter/material.dart';

class BuildTeamPage extends StatelessWidget {
  const BuildTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR
          Container(
            width: 220,
            color: const Color(0xFF081220),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "DraftFut",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),
                const SizedBox(height: 40),

                menuItem("Dashboard", () {
                  Navigator.pushNamed(context, '/dashboard');
                }),

                menuItem("Build Team", () {}, active: true),

                menuItem("Points", () {}),
                menuItem("Ranking", () {}),
                menuItem("Leagues", () {}),

                const Spacer(),

                menuItem("Logout", () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
              ],
            ),
          ),

          // CONTEÚDO CENTRAL
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Build Your Team",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Select 11 players to create your dream squad",
                  ),
                  const SizedBox(height: 20),

                  // CAMPO
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade900,
                            Colors.green.shade800
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double w = constraints.maxWidth;
                          double h = constraints.maxHeight;

                          return Stack(
                            children: [
                              player("GK", w * 0.45, h * 0.85),

                              player("LB", w * 0.1, h * 0.65),
                              player("CB", w * 0.3, h * 0.65),
                              player("CB", w * 0.5, h * 0.65),
                              player("RB", w * 0.7, h * 0.65),

                              player("LM", w * 0.2, h * 0.45),
                              player("CM", w * 0.4, h * 0.45),
                              player("CM", w * 0.6, h * 0.45),
                              player("RM", w * 0.8, h * 0.45),

                              player("ST", w * 0.35, h * 0.2),
                              player("ST", w * 0.6, h * 0.2),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LADO DIREITO
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF0B1A2A),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Player Selection",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  searchBar(),

                  const SizedBox(height: 15),

                  playerCard("Alisson Becker", "Liverpool"),
                  playerCard("Ederson", "Man City"),
                  playerCard("David Raya", "Arsenal"),

                  const Spacer(),

                  const Divider(),

                  const Text("Team Statistics"),
                  const SizedBox(height: 10),
                  const Text("Total Value: £102.5M"),
                  const Text("Total Points: 2455"),
                  const Text("Budget Remaining: £-2.5M"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // MENU
  Widget menuItem(String title, VoidCallback onTap,
      {bool active = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: active ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.circle, size: 10),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  // JOGADOR NO CAMPO
  Widget player(String label, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.greenAccent,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // CARD DE JOGADOR
  Widget playerCard(String name, String team) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(team, style: const TextStyle(fontSize: 12)),
              ]),
          const Icon(Icons.add, color: Colors.green),
        ],
      ),
    );
  }

  // SEARCH BAR
  Widget searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search players...",
        filled: true,
        fillColor: Colors.white10,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

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
                const Text("DraftFut",
                    style: TextStyle(fontSize: 22, color: Colors.green)),
                const SizedBox(height: 40),

                menuItem("Dashboard", () {
                  Navigator.pushNamed(context, '/dashboard');
                }),
                menuItem("Build Team", () {
                  Navigator.pushNamed(context, '/build-team');
                }),
                menuItem("Points", () {}),
                menuItem("Ranking", () {}, active: true),
                menuItem("Leagues", () {}),

                const Spacer(),

                menuItem("Logout", () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
              ],
            ),
          ),

          // CONTEÚDO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Global Ranking",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Compete with managers worldwide"),
                  const SizedBox(height: 20),

                  // CARDS SUPERIORES
                  Row(
                    children: [
                      statCard("Your Rank", "#10", "+24 this week",
                          Colors.green),
                      statCard("Total Managers", "9.2M", "Worldwide",
                          Colors.blue),
                      statCard("Points Behind Leader", "469", "Catchable!",
                          Colors.orange),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // SEARCH
                  searchBar(),

                  const SizedBox(height: 20),

                  // LEADERBOARD
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B1A2A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Leaderboard",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),

                          Expanded(
                            child: ListView(
                              children: [
                                leaderboardItem(1, "FootballKing",
                                    "The Winners", "2.456"),
                                leaderboardItem(2, "ProManager",
                                    "Elite Squad", "2.398"),
                                leaderboardItem(
                                    8, "All Stars FC", "", "2.055"),
                                leaderboardItem(9, "WinnerMindset",
                                    "Never Give Up", "2.034"),
                                leaderboardItem(10, "You",
                                    "Green Warriors", "1.987",
                                    highlight: true),
                                leaderboardItem(11, "FootballFan",
                                    "Fan Favorites", "1.923"),
                                leaderboardItem(12, "GameChanger",
                                    "Game Changers", "1.876"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PERFORMANCE
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B1A2A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Your Performance",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                            "You're in the top 0.0001% of all managers worldwide!"),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Country Rank: #3"),
                            Text("Region Rank: #1"),
                            Text("League Avg Rank: #2"),
                            Text("Best Rank: #4"),
                          ],
                        )
                      ],
                    ),
                  )
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

  // CARD SUPERIOR
  Widget statCard(
      String title, String value, String subtitle, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0B1A2A),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 10),
            Text(value,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color)),
            Text(subtitle),
          ],
        ),
      ),
    );
  }

  // ITEM DA LISTA
  Widget leaderboardItem(int pos, String name, String team, String points,
      {bool highlight = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlight ? Colors.green.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("$pos",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(team,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          Text("$points pts"),
        ],
      ),
    );
  }

  // SEARCH
  Widget searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search managers or teams...",
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
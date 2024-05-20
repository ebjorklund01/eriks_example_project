import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'dart:math';

class Player {
  final String name;
  final String symbol;
  final Color color;
  final IconData icon;

  Player._(this.name, this.symbol, this.color, this.icon);

  Player.humanTeam() : this._('Human', 'X', Colors.red, Icons.person);

  Player.robotTeam() : this._('Gemini', 'O', Colors.yellow, Icons.android);
}

class ErikScreen extends StatefulWidget {
  const ErikScreen({Key? key}) : super(key: key);

  @override
  _ErikScreenState createState() => _ErikScreenState();
}

class _ErikScreenState extends State<ErikScreen> {
  final gemini = Gemini.instance;
  List<List<Player?>> board = List.generate(6, (_) => List.filled(7, null));
  Player player1 = Player.humanTeam();
  Player player2 = Player.robotTeam();
  bool isPlayer1Turn = true;
  bool isWinner = false;
  Player? winningPlayer;

  Text get turnText {
    final color = isPlayer1Turn ? player1.color : player2.color;

    if (isWinner) {
      return Text(
        'Congratulations ${winningPlayer!.name}!',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: winningPlayer!.color),
      );
    }

    return Text(
      isPlayer1Turn ? player1.name : player2.name,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
    );
  }

  @override
  void initState() {
    super.initState();
    resetBoard();
  }

  void resetBoard() {
    chats = [_systemPrompt];
    setState(() {
      board = List.generate(6, (_) => List.filled(7, null));
      isPlayer1Turn = Random().nextBool(); // Randomize the starting turn
      isWinner = false;
      winningPlayer = null;
    });

    if (!isPlayer1Turn) {
      getRobotMove();
    }
  }

  List<Content> chats = [];

  Content get _systemPrompt {
    return Content(parts: [
      Parts(text: '''
        Provide the next move for the robot in the Connect Four game.
        The board is represented as a 6x7 grid (6 rows and 7 columns), with the following symbols:
        - X for the human team
        - O for the robot team
        - - for empty cells
        Every cell in the board is separated by a comma.
        The robot should always play the best move possible.

        The response should be a single integer representing the column where the robot should place its piece.

        The piece will be placed in the lowest available row in the specified column.

        Example 1:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        X,-,-,-,-,-,-
        O,-,-,-,-,-,-
        O,-,X,-,O,-,-

       Playing in column 0 would result in the following board state:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        O,-,-,-,-,-,-
        X,-,-,-,-,-,-
        O,-,-,-,-,-,-
        O,-,X,-,O,-,-

        Example 2:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        X,X,-,-,-,-,-
        O,O,X,-,-,-,-
        O,X,O,-,-,-,-

       Playing in column 2 would result in the following board state:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        X,X,O,-,-,-,-
        O,O,X,-,-,-,-
        O,X,O,-,-,-,-

        Example 3:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        X,-,-,-,-,-,-
        O,-,-,-,-,-,-
        O,-,X,-,O,-,-

       Playing in column 1 would result in the following board state:

        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        -,-,-,-,-,-,-
        X,-,-,-,-,-,-
        O,-,-,-,-,-,-
        O,O,X,-,O,-,-
        ''')
    ], role: 'model');
  }

  String get _currentBoard => board
      .map((row) => row
          .map((player) => player == null
              ? '-'
              : player == player1
                  ? 'X'
                  : 'O')
          .join(','))
      .join('\n');

  Future<void> getRobotMove() async {
    setState(() {
      isPlayer1Turn = false;
    });

    final boardString = _currentBoard;

    final currentBoard =
        Content(parts: [Parts(text: boardString)], role: 'user');

    chats.add(currentBoard);
    print('Current board state added to chats: $_currentBoard');

    for (int i = 0; i < 5; i++) {
      try {
        print('Attempt ${i + 1} to get robot move');
        final response = await gemini.chat(chats);
        if (response?.content != null) {
          final parts = response!.content!.parts!;
          chats.add(response.content!);
          print('Response received and added to chats: ${response.content}');
          final lastPart = parts.last;
          final move = int.tryParse(lastPart.text?.trim() ?? '');
          if (move != null && move >= 0 && move < 7) {
            print('Valid move received: col $move');
            setState(() {
              int row = findEmptyRow(move);
              if (row != -1) {
                board[row][move] = player2;
                if (checkForWinner(row, move)) {
                  isWinner = true;
                  winningPlayer = player2;
                }
                isPlayer1Turn = true;
              }
            });
            return;
          } else {
            throw Exception('Invalid response from robot');
          }
        }
      } on GeminiException catch (e) {
        print('GeminiException: ${e.message}');
        print('Status code: ${e.statusCode}');
      } catch (e) {
        print('Error: $e');
        print('Retrying... (${i + 1}/5)');
      }
    }
    throw Exception('Failed to get robot move after 5 retries');
  }

  @override
  Widget build(BuildContext context) {
    final gridSize = MediaQuery.of(context).size.width / 7;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Erik Screen'), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            resetBoard();
            isWinner = false;
            winningPlayer = null;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: turnText,
          )),
          Container(
            color: Colors.blueGrey,
            height: gridSize * 6,
            width: gridSize * 7,
            child: GridView.builder(
              itemCount: 42,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ 7;
                int col = index % 7;
                return GestureDetector(
                  onTap: isPlayer1Turn
                      ? () {
                          setState(() {
                            if (!isWinner && board[0][col] == null) {
                              int emptyRow = findEmptyRow(col);
                              if (emptyRow != -1) {
                                board[emptyRow][col] =
                                    isPlayer1Turn ? player1 : player2;
                                if (checkForWinner(emptyRow, col)) {
                                  isWinner = true;
                                  winningPlayer =
                                      isPlayer1Turn ? player1 : player2;
                                } else {
                                  isPlayer1Turn = !isPlayer1Turn;
                                  getRobotMove();
                                }
                              }
                            }
                          });
                        }
                      : null,
                  child: Container(
                    height: gridSize,
                    width: gridSize,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: board[row][col] == null
                          ? Theme.of(context).colorScheme.background
                          : board[row][col]!.color,
                    ),
                    child: Icon(board[row][col]?.icon),
                  ),
                );
              },
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  int findEmptyRow(int col) {
    for (int i = 5; i >= 0; i--) {
      if (board[i][col] == null) {
        return i;
      }
    }
    return -1;
  }

  bool checkForWinner(int row, int col) {
    Player? player = board[row][col];
    if (player == null) return false;

    List<List<int>> directions = [
      [0, 1],
      [1, 0],
      [1, 1],
      [1, -1]
    ];

    for (var direction in directions) {
      int count = 1;

      for (int i = 1; i < 4; i++) {
        int newRow = row + i * direction[0];
        int newCol = col + i * direction[1];
        if (newRow < 0 ||
            newRow >= 6 ||
            newCol < 0 ||
            newCol >= 7 ||
            board[newRow][newCol] != player) break;
        count++;
      }

      for (int i = 1; i < 4; i++) {
        int newRow = row - i * direction[0];
        int newCol = col - i * direction[1];
        if (newRow < 0 ||
            newRow >= 6 ||
            newCol < 0 ||
            newCol >= 7 ||
            board[newRow][newCol] != player) break;
        count++;
      }

      if (count >= 4) return true;
    }

    return false;
  }
}

import 'dart:io';

void main(List<String> arguments) {
  exitCode = 0;
  hangman(arguments[0]);
}


void hangman(word) {
  int wrong = 0; //プレイヤーが何回間違えたか
  List stages = [
    "",
    "---------",
    "|   |",
    "|   0",
    "|  /|/",
    "|   //",
    "|",
    "|",
  ];
  dynamic word_disassembly = word.split('');
  dynamic board = [];
  for (var i = 0; i < word.length; i++) {
    board.add("_");
  }

  print("Welcome to Hangman");

  //ここからゲームの具体的な処理
  while (true) {
    print("Predict one letter!");
    dynamic char = stdin.readLineSync();
//入力した文字列が入ってるかの確認
    if (word_disassembly.contains(char)) {
      print("Correct!");
      board[word_disassembly.indexOf(char)] = char;
      print(board);
    } else {
      print("Failure!");
      wrong += 1;
    }
    stages.removeAt(0); //stagesの値を前から一個削除
    print(stages.join("\n")); //stagesを見やすいように改行を入れる
    //boardから"_"がなくなったら勝ちの処理実行
    if (!board.contains("_")) {
      print("You win! Correct answer is${word}");
      exitCode = 0;
      break;
    }
    //stagesの値がなくなったら負けの処理実行
    if (stages.isEmpty) {
      print("You lose! The correct answer is${word}");
      exitCode = 1;
      break;
    }
  }
}

import 'dart:io';

void main(List<String> arguments) {
  if(arguments.isEmpty){
    exit(-1);
  }
  exitCode = 0;
  hangman(arguments[0]);
}

//TODO: support random length word
void hangman(String word) {
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
  var guessed_char = [];
  var board = [];
  for (var i = 0; i < word.length; i++) {
    board.add("_");
  }

  print("Welcome to Hangman");

  //ここからゲームの具体的な処理
  while (true) {
    print("Predict one letter!");
    var guess = stdin.readLineSync();
    if (guess == null) {
      print("invalid input");
      wrong += 1;
      continue;
    }
//入力した文字列が入ってるかの確認
//char
    if (guess.length == 1) {
      if (guessed_char.contains(guess)) {
        print("Already predicted");
        wrong += 1;
      } else if (word.contains(guess)) {
        print("Correct!");
        guessed_char.add(guess);
        for (int i = 0; i < word.length; i++) {
          if (guess == word[i]) {
            board[i] = guess;
          }
        }
      } else {
        print("Failure!");
        wrong += 1;
      }
    }
    //word
    else {
      if (word != guess) {
        print("Failure!");
        wrong += 1;
      } else {
        print('Correct');
        for (int i = 0; i < word.length; i++) {
            board[i] = word[i];         
        }
      }
    }
    print(board);

    stages.removeAt(0); //stagesの値を前から一個削除
    print(stages.join("\n")); //stagesを見やすいように改行を入れる

    //boardから"_"がなくなったら勝ちの処理実行
    if (!board.contains("_")) {
      print("You win! Correct answer is ${word}");
      exitCode = 0;
      break;
    }
    //stagesの値がなくなったら負けの処理実行
    if (stages.isEmpty) {
      print("You lose! The correct answer is ${word}");
      exitCode = 1;
      break;
    }
  }
}

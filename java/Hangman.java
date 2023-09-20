import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Hangman {

    public static void main(String[] args) {
        if (args.length == 0) {
            System.exit(-1);
        }
        hangman(args[0]);
    }

    public static void hangman(String word) {
        int wrong = 0;
        List<String> stages = new ArrayList<>();
        stages.add("");
        stages.add("---------");
        stages.add("|   |");
        stages.add("|   0");
        stages.add("|  /|/");
        stages.add("|   //");
        stages.add("|");
        stages.add("|");

        List<String> guessedChar = new ArrayList<>();
        char[] board = new char[word.length()];
        for (int i = 0; i < word.length(); i++) {
            board[i] = '_';
        }

        System.out.println("Welcome to Hangman");

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Predict one letter!");
            String guess = scanner.nextLine();

            if (guess.isEmpty()) {
                System.out.println("invalid input");
                wrong++;
                continue;
            }

            // char prediction
            if (guess.length() == 1) {
                if (guessedChar.contains(guess)) {
                    System.out.println("Already predicted");
                    wrong++;
                } else if (word.contains(guess)) {
                    System.out.println("Correct!");
                    guessedChar.add(guess);
                    for (int i = 0; i < word.length(); i++) {
                        if (guess.charAt(0) == word.charAt(i)) {
                            board[i] = guess.charAt(0);
                        }
                    }
                } else {
                    System.out.println("Failure!");
                    wrong++;
                }
            } 
            // word prediction
            else {
                if (!word.equals(guess)) {
                    System.out.println("Failure!");
                    wrong++;
                } else {
                    System.out.println("Correct!");
                    board = word.toCharArray();
                }
            }

            System.out.println(board);
            
            stages.remove(0);
            for (String s : stages) {
                System.out.println(s);
            }

            if (new String(board).indexOf('_') == -1) {
                System.out.println("You win! Correct answer is " + word);
                System.exit(0);
                break;
            }

            if (stages.isEmpty()) {
                System.out.println("You lose! The correct answer is " + word);
                System.exit(1);
                break;
            }
        }
    }
}

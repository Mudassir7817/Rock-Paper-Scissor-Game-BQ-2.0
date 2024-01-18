import 'dart:math';
import 'dart:io';

void main(){
  print('************ WELCOME **********');
  PlayGame playgame = PlayGame();
  while(true){
    print('\nChoose your move: rock, paper, scissor or (write exit to exit) ');

    String userMove = playgame.getUserMove();
    print("Your move: $userMove");

    if(userMove.toLowerCase() == 'exit'){
      print('GoodBye :)');
      break;
    }

    String compMove = playgame.getCompMove();
    print("Computer's move: $compMove");

    String result = playgame.determineWinner(userMove, compMove);
    print('Result: $result');
  }
}
class PlayGame{
  String getUserMove(){
  String input = stdin.readLineSync()!;
  return input.toLowerCase();
}

String getCompMove(){
  List<String> moves = ['rock','paper','scissor'];
  Random random = Random();
  int index = random.nextInt(3);
  return moves[index];
}

String determineWinner(userMove, compMove){
  if(userMove == compMove){
    return "It's a tie!";
  }else if((userMove == 'scissor' && compMove == 'paper') || 
  (userMove == 'rock' && compMove == 'scissor') || 
  (userMove == 'paper' && compMove == 'rock')){
    return "You win!";
  }else{
    return "computer win!";
  }
}
}


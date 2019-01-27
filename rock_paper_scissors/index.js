// Computer ramdomized selection
const computerPlay = () => {
  const options = ["rock", "paper", "scissors"];
  const selection = Math.floor(Math.random() * 3);
  return options[selection];
};

const playRound = (playerSelection, computerSelection) => {
  const player = playerSelection.toLowerCase();
  const computer = computerSelection;

  // Ways to lose when player picks Rock
  if (player === "rock" && computer === "paper") {
    return `You Lose! ${computer} beats ${player}`;
    // Ways to win when player picks Rock
  } else if (player === "rock" && computer === "scissors") {
    return `You Win! ${player} beats ${computer}`;
    // Player lose with paper pick
  } else if (player === "paper" && computer === "scissors") {
    return `You Lose! ${computer} beats ${player}`;
    // Player wins with paper pick
  } else if (player === "paper" && computer === "rock") {
    return `You Win! ${player} beats ${computer}`;
    // Player lose with scissors pick
  } else if (player === "scissors" && computer === "rock") {
    return `You Lose! ${computer} beats ${player}`;
    // Player wins with scissors pick
  } else if (player === "scissors" && computer === "paper") {
    return `You Win! ${player} beats ${computer}`;
  } else {
    return "Its a draw!";
  }
};

const game = () => {
  let wins = 0;
  let losses = 0;
  let gameEnd = true;
  // Loop will run until a best of 5 is decided
  while (gameEnd) {
    const player = window.prompt("Make your pick: Rock, Paper or Scissors");
    const computer = computerPlay();
    const result = playRound(player, computer);
    if (result.includes("Win!")) {
      wins++;
    } else if (result.includes("Lose!")) {
      losses++;
    }

    if (wins === 3 || losses === 3) {
      gameEnd = false;
    }
    console.log(result);
    console.log(`Wins: ${wins} and Losses: ${losses}`);
  }

  wins === 3 ? console.log("You Won!") : console.log("You Lose!");
  console.log(`With a score of You: ${wins} vs Computer: ${losses}`);
};

game();

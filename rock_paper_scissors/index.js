const optionButtons = document.querySelectorAll(".btn-secondary");
const message = document.querySelector("#message");
const playerScore = document.querySelector("#playerScore");
const computerScore = document.querySelector("#computerScore");
const resetButton = document.querySelector("#reset");

// Score Keeping;
let wins = 0;
let losses = 0;

// Computer ramdomized selection
const computerPlay = () => {
  const options = ["rock", "paper", "scissors"];
  const selection = Math.floor(Math.random() * 3);
  return options[selection];
};

const playRound = (playerSelection, computerSelection) => {
  const player = playerSelection;
  const computer = computerSelection;

  // Ways to lose when player picks Rock
  if (player === "rock" && computer === "paper") {
    return `You Lose!`;
    // Ways to win when player picks Rock
  } else if (player === "rock" && computer === "scissors") {
    return `You Win!`;
    // Player lose with paper pick
  } else if (player === "paper" && computer === "scissors") {
    return `You Lose!`;
    // Player wins with paper pick
  } else if (player === "paper" && computer === "rock") {
    return `You Win!`;
    // Player lose with scissors pick
  } else if (player === "scissors" && computer === "rock") {
    return `You Lose!`;
    // Player wins with scissors pick
  } else if (player === "scissors" && computer === "paper") {
    return `You Win!`;
  } else {
    return "Its a draw!";
  }
};

const game = playerSelection => {
  const player = playerSelection;
  const computer = computerPlay();
  const result = playRound(player, computer);
  if (result.includes("Win!")) {
    wins++;
  } else if (result.includes("Lose!")) {
    losses++;
  }

  message.textContent = result;
  playerScore.textContent = wins;
  computerScore.textContent = losses;
};

// EventListerners
optionButtons.forEach(button => {
  button.addEventListener("click", e => {
    // Start game with selection
    game(e.target.id);
  });
});

// Reset Button
resetButton.addEventListener("click", () => {
  wins = 0;
  losses = 0;
  playerScore.textContent = "0";
  computerScore.textContent = "0";
  message.textContent = "";
});

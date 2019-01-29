const grid = document.querySelector("#grid");
const reset = document.querySelector("#reset");
const custom = document.querySelector("#custom");
const colorful = document.querySelector("#colorful");
let gridNum = 16;
let colorfulMode = false;

const buildGrid = gridSize => {
  const squares = gridSize * gridSize;
  for (let i = 0; i < squares; i++) {
    const square = document.createElement("div");
    square.id = i;
    square.classList.add("singleSquare");
    square.style.cssText = `height: ${100 / gridSize}%; width: ${100 /
      gridSize}%;`;
    grid.appendChild(square);
  }

  // Initialize mouseover events
  const gridSquares = document.querySelectorAll(".singleSquare");

  gridSquares.forEach(square => {
    square.addEventListener("mouseover", e => {
      const color = colorFunc();
      e.target.style.cssText =
        e.target.style.cssText + `background: #${color};`;
    });
  });
};

// Hex color randomizer
const colorFunc = () => {
  const colorsKeys = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F"
  ];
  let hexValue = "";

  if (colorfulMode === false) {
    return "000";
  }
  for (let i = 0; i < 6; i++) {
    const ramdonNum = Math.floor(Math.random() * colorsKeys.length);
    hexValue += colorsKeys[ramdonNum];
  }
  return hexValue;
};

buildGrid(gridNum);

// Events
reset.addEventListener("click", () => {
  grid.innerHTML = "";
  buildGrid(gridNum);
});

custom.addEventListener("click", () => {
  const customGridSize = window.prompt("Please Enter the Size of the Grid");
  gridNum = customGridSize;
  grid.innerHTML = "";
  buildGrid(gridNum);
});

colorful.addEventListener("click", () => {
  colorfulMode = !colorfulMode;
});

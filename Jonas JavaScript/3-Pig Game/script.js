// //Variables=================================
var scores, roundScore1, tempDice, activePlayer, gameRunning;
gameRunning = true;
newGame();

// //functions=================================
// function btn() {
//   //Math.floor rounds decimal
//   dice = Math.floor(Math.random() * 6) + 1;
//
//   //We use querySelector to select an id and also .textContent
//   //to change the text and make it = dice
//   document.querySelector('#current-' + activePlayer).textContent = dice;
//   //We can do it this way as well using 'inner html' instead of textContent
//   //document.querySelector('#current-' + activePlayer).innerHTML = '<em>' + dice + '</em>';
//
//   var x = document.querySelector('#score-0').textContent;
//
//   //Hides the dice using style property.  We do not use #, but . because it is
//   //a class instead of id.
//   document.querySelector('.dice').style.display = 'none';
// }

// // the 2nd argument 'btn' is a callback function.  it is a callback
// // fn because it is called by another function.
// document.querySelector('.btn-roll').addEventListener('click', btn);

//we can also use an anonymous function like so
document.querySelector('.btn-roll').addEventListener('click', function () {
  if(gameRunning){
    // 1) random number
    var dice = Math.floor(Math.random() * 6) + 1;

    // 2) Display Result
    var diceDOM = document.querySelector('.dice');
    diceDOM.style.display = 'block';
    diceDOM.src = 'dice-' + dice + '.png';

    // 3) Update the round score IF the rolled number was not a 1
    if (dice !== 1){
        //add scores
        roundScore1 += dice;
        document.querySelector('#current-' + activePlayer).textContent = roundScore1;
    }else {
        nextPlayer();
    }
  }
});

document.querySelector('.btn-hold').addEventListener('click', function () {
  if(gameRunning){
    scores[activePlayer] += roundScore1;

    document.getElementById('score-' + activePlayer).textContent = scores[activePlayer];

    if(scores[activePlayer] >= 20){
      document.querySelector('#name-' + activePlayer).textContent = 'WINNER';
      document.querySelector('.dice').style.display = 'none';
      document.querySelector('.player-' + activePlayer +'-panel').classList.add('winner');
      document.querySelector('.player-' + activePlayer +'-panel').classList.remove('active');

      gameRunning = false;
    }else{
      nextPlayer();
    }
  }
});



function nextPlayer() {
  //ternary operator.  if activePlayer is 0, then activePlayer = 1,
  //else activePlayer = 0
  activePlayer === 0 ? activePlayer = 1 : activePlayer = 0;
  roundScore1 = 0;

  //set current to 0
  document.getElementById('current-0').textContent = '0';
  document.getElementById('current-1').textContent = '0';

  // //How to add and remove class
  // document.querySelector('.player-0-panel').classList.remove('active');
  // document.querySelector('.player-1-panel').classList.add('active');

  // //We can use toggle to do it aswell.  toggle makes sure if it doesnt have
  // it then it will remove or add
  document.querySelector('.player-0-panel').classList.toggle('active');
  document.querySelector('.player-1-panel').classList.toggle('active');

  //hide dice again for new turn
  document.querySelector('.dice').style.display = 'none';
}

document.querySelector('.btn-new').addEventListener('click', newGame)

function newGame(){
  scores = [0,0];
  roundScore1 = 0;
  activePlayer = 0;
  gameRunning = true;

  //Hide dice
  document.querySelector('.dice').style.display = 'none';

  //we can get id faster by using .getElementById instead of querySelector for ids
  document.getElementById('score-0').textContent = '0';
  document.getElementById('score-1').textContent = '0';
  document.getElementById('current-0').textContent = '0';
  document.getElementById('current-1').textContent = '0';
  document.getElementById('name-0').textContent = 'Player 1';
  document.getElementById('name-1').textContent = 'Player 2';
  document.querySelector('.player-0-panel').classList.remove('active');
  document.querySelector('.player-1-panel').classList.remove('active');
  document.querySelector('.player-0-panel').classList.remove('winner');
  document.querySelector('.player-1-panel').classList.remove('winner');
  document.querySelector('.player-0-panel').classList.add('active');
}










//

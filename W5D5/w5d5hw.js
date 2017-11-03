window.setTimeout(function() {
  alert('HAMMERTIME');
}, 5000);

const hammerTime = function (time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, time);
};

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const teaBiscuit = function () {
  reader.question('You want tea?', function (answer1) {
    console.log(`ok, you said ${answer1}.`);
    reader.question('You want biscuits with that tea?', function (answer2) {
      console.log(`ok, you said ${answer2}.`);
      const first = (answer1 === 'yes') ? 'do' : 'don\'t';
      const second = (answer2 === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
};

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
}

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles);

Noodles.chase.apply(Markov, [Noodles]);

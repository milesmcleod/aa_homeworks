// Part 1

function madLib (verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()}` +
  ` the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring (searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz (array) {
  const newArray = [];
  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 ===0)) {
      newArray.push(el);
    }
  });
  return newArray;
}

function isPrime (n) {
  if (n < 2) { return false; }
  for(let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

function firstNPrimes (n) {
  const primes = [];
  for(let i = 2; primes.length < n; i++) {
    if (isPrime(i)) {
      primes.push(i);
    }
  }
  return primes;
}

function sumOfNPrimes (n) {
  const primes = firstNPrimes(n);
  var sum = 0;
  primes.forEach((el) => {
    sum += el;
  });
  return sum;
}

// Part 2

// Phase 1

function printCallback (array) {
  array.forEach((el) => {
    console.log(el);
  });
}

function titleize (array, cb) {

  var newArray = array.map(function(x) {
    return `Mx. ${x} Jingleheimer Schmidt`;
  });

  return cb(newArray);
}

// titleize(["Mary", "Brian", "Leo"], printCallback);



// Phase 2


function Elephant (name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let trick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
  console.log(`${this.name} is ${trick}`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is rolling by in a Camaro!!`);
};

herd.forEach((el) => {
  Elephant.paradeHelper(el);
});

//Phase 4

function dinerBreakfast () {
  let order = 'Lemme get them bacon and eggs plz.';
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 5)} and ${food} plz.`;
    console.log(order);
  };
}

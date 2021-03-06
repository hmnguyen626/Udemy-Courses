// =====================================
// Lecture: Function constructor

// var john = {
//     name: 'John',
//     yearOfBirth: 1990,
//     job: 'teacher'
// };
//
// var Person = function(name, yearOfBirth, job) {
//     this.name = name;
//     this.yearOfBirth = yearOfBirth;
//     this.job = job;
// }
//
// Person.prototype.calculateAge  = function() {
//     console.log(2016 - this.yearOfBirth);
// };
//
// Person.prototype.lastName = 'Smith';
//
// var john = new Person('John', 1990, 'teacher');
// var jane = new Person('Jane', 1969, 'designer');
// var mark = new Person('Mark', 1948, 'retired');
//
// john.calculateAge();
// jane.calculateAge();
// mark.calculateAge();
//
// console.log(john.lastName);
// console.log(jane.lastName);
// console.log(mark.lastName);


// =====================================
// Lecture: Object.create

// var personProto = {
//     calculateAge: function() {
//         console.log(2016 - this.yearOfBirth);
//     }
// };
//
// var john = Object.create(personProto);
// john.name = 'John';
// john.yearOfBirth = 1990;
// john.job = 'teacher';
//
// var jane = Object.create(personProto, {
//     name: { value: 'Jane' },
//     yearOfBirth: { value: 1969 },
//     job: { value: 'designer' }
// });


// // =====================================
// // Lecture: Primitives vs objects
//
// // Primitives
// var a = 23;
// var b = a;
// a = 46;
// console.log(a);
// console.log(b);
//
//
//
// // Objects
// var obj1 = {
//     name: 'John',
//     age: 26
// };
// var obj2 = obj1;
// obj1.age = 30;
// console.log(obj1.age);
// console.log(obj2.age);
//
// // Functions
// var age = 27;
// var obj = {
//     name: 'Jonas',
//     city: 'Lisbon'
// };
//
// function change(a, b) {
//     a = 30;
//     b.city = 'San Francisco';
// }
//
// change(age, obj);
//
// console.log(age);
// console.log(obj.city);




// =====================================
// Lecture: Passing functions as arguments

// var years = [1990, 1965, 1937, 2005, 1998];
//
// function arrayCalc(arr, fn) {
//     var arrRes = [];
//     for (var i = 0; i < arr.length; i++) {
//         arrRes.push(fn(arr[i]));
//     }
//     return arrRes;
// }
//
// function calculateAge(el) {
//     return 2016 - el;
// }
//
// function isFullAge(el) {
//     return el >= 18;
// }
//
// function maxHeartRate(el) {
//     if (el >= 18 && el <= 81) {
//         return Math.round(206.9 - (0.67 * el));
//     } else {
//         return -1;
//     }
// }
//
//
// var ages = arrayCalc(years, calculateAge);
// var fullAges = arrayCalc(ages, isFullAge);
// var rates = arrayCalc(ages, maxHeartRate);
//
// console.log(ages);
// console.log(rates);

// =====================================
// Lecture: Functions returning functions

// function interviewQuestion(job) {
//     if (job === 'designer') {
//         return function(name) {
//             console.log(name + ', can you please explain what UX design is?');
//         }
//     } else if (job === 'teacher') {
//         return function(name) {
//             console.log('What subject do you teach, ' + name + '?');
//         }
//     } else {
//         return function(name) {
//             console.log('Hello ' + name + ', what do you do?');
//         }
//     }
// }
//
// var teacherQuestion = interviewQuestion('teacher');
// var designerQuestion = interviewQuestion('designer');
//
//
// teacherQuestion('John');
// designerQuestion('John');
// designerQuestion('jane');
// designerQuestion('Mark');
// designerQuestion('Mike');
//
// interviewQuestion('teacher')('Mark');                                                        

// // =====================================
// // Lecture: IIFE
// // function game() { //weak
// //   var score = Math.random() * 10;
// //   console.log(score >= 5);
// // }
// // game();
//
// (function() {
//   var score = Math.random() * 10;
//   console.log(score >= 5);
// })();
//
// // console.log(score); //wont work outside IIFE
//
// (function(goodLuck) { //We can also pass arguments to IIFE like so
//   var score = Math.random() * 10;
//   console.log(score >= 5 - goodLuck);
// })(5);  //5 is goodLuck


// // =====================================
// // Lecture: Closures
// function retirement(retirementAge) {
//     var a = ' years left until retirement.';
//
//     return function(yearOfBirth) {
//         var age = 2017 - yearOfBirth
//         console.log((retirementAge - age) + a);
//     }
// }
//
// var retirementUS = retirement(66);
// retirementUS(1991); //40 years left until retirement.
//
// //works as well
// retirement(66)(1991); //40 years left until retirement.
//
// //use cases-
// var retirementGermany = retirement(65);
// var retirementIceland = retirement(67);
//
// retirementGermany(1985);  //33 years left until retirement.
// retirementIceland(1966);  //16 years left until retirement.
//
// //Challenge-Rewrite interviewQuestion as a closure
// function interviewQuestion(job) {
//     var ask = ' , is a good job!';
//
//     return function() {
//         switch (job) {
//           case 'teacher':
//             console.log(job + ask);
//             break;
//           case 'student':
//             console.log(job + ask);
//             break;
//           case 'programmer':
//             console.log(job + ask);
//             break;
//           default:
//             console.log(job + ', I am not sure what this job is!');
//         }
//     }
// }
//
// var teacherJob = interviewQuestion('teacher');
// var studentJob = interviewQuestion('student');
// var programmerJob = interviewQuestion('programmer');
// var dogJob = interviewQuestion('dog');
// teacherJob();
// studentJob();
// programmerJob();
// dogJob();
//
// //works aswell
// interviewQuestion('dancer')();


// // =====================================
// // Lecture: Bind, Call, and Apply
// var hieu = {
//     name: 'hieu',
//     age: 27,
//     job: 'student',
//     presentation: function(style, timeOfDay) {
//         if (style === 'formal') {
//             console.log('Good ' +  timeOfDay + ', ladies and gentlement. I am '
//           + this.name + ', I am a ' + this.job + ' and I am ' + this.age + ' years old.');
//         }else if (style === 'friendly') {
//             console.log('Hey! What is up? I am ' + this.name + ', I am a ' + this.job
//             + ' and I am ' + this.age + ' years old.' + ' Have a nice ' + timeOfDay + '.');
//         }
//     }
// }
//
// var wendy = {
//     name: 'wendy',
//     age: 26,
//     job: 'teacher'
// }
//
// hieu.presentation('formal', 'morning'); //Good morning, ladies and gentlement. I am hieu, I am a student and I am 27 years old.
//
// //using call to change this. from hieu object to wendy.  This is called 'Method borrowing'
// hieu.presentation.call(wendy, 'friendly', 'afternoon'); //Hey! What is up? I am wendy, I am a teacher and I am 26 years old. Have a nice afternoon.
//
// //using apply to store arguments in an array
// hieu.presentation.apply(wendy, ['friendly', 'afternoon']);
//
// //bind is similar to call, but sets this explicitly.
// //bind doesnt immediately call the fn, but generates the fn and store somewhere.
// //this is useful for fns with preset arguments
// var hieuFriendly = hieu.presentation.bind(hieu, 'friendly') //preset arguments, called 'carrying'
//
// hieuFriendly('morning'); //Hey! What is up? I am hieu, I am a student and I am 27 years old. Have a nice morning.
// hieuFriendly('night');
//
// var wendyFormal = hieu.presentation.bind(wendy, 'formal');
// wendyFormal('afternoon');   //Good afternoon, ladies and gentlement. I am wendy, I am a teacher and I am 26 years old.
//
// //example
// var years = [1990, 1965, 1937, 2005, 1998];
//
// function arrayCalc(arr, fn) {
//     var arrRes = [];
//     for (var i = 0; i < arr.length; i++) {
//         arrRes.push(fn(arr[i]));
//     }
//     return arrRes;
// }
//
// function calculateAge(el) {
//     return 2016 - el;
// }
//
// function isFullAge(limit, el) {
//     return el >= limit;
// }
//
// var ages = arrayCalc(years, calculateAge);
//
// //here we do not pass isFullAge fn, but a copy of it with a PRESET argument of 20
// var fullJapan = arrayCalc(ages, isFullAge.bind(this, 20));
// console.log(ages); //[26, 51, 79, 11, 18]]
// console.log(fullJapan); //[true, true, true, false, false]


// // =====================================
// // Lecture: Coding Challenge
// (function () {  //IIFE makes it private, since it creates a new scope
//     var game = true;
//     var score = 0;
//
//     var Questions = function(question, listOfAnswers, answer) {
//         this.question = question;
//         this.listOfAnswers = listOfAnswers;
//         this.answer = answer;
//     }
//
//     Questions.prototype.displayQuestion = function () {
//         console.log(this.question);
//
//         for (var i = 0; i < this.listOfAnswers.length; i++) {
//           console.log(i + ': ' + this.listOfAnswers[i]);
//         }
//
//         var input = prompt('Please type correct answer (just number)')
//
//         if (input === this.answer) {
//             score++;
//             console.log('correct!' + ' SCORE: ' + score);
//         }else if (input === 'exit') {
//             game = false;
//         }
//         else {
//             console.log('incorrect!');
//         }
//     }
//
//     var q1 = new Questions('What is my name?', ['Hieu', 'Bear', 'Wendo'], '0');
//     var q2 = new Questions('Who is favorite girl?', ['Wendy', 'Wendo', 'Bear'], '0');
//     var q3 = new Questions('Who is baby?', ['Hieu', 'Bear', 'Wendo'], '1');
//     var q4 = new Questions('Omelette and ?', ['Rice', 'More Eggs', 'Salt'], '0');
//     var q5 = new Questions('Snowboard or Ski?', ['Ski', 'Snowboard', 'Both'], '2');
//
//     var listOfQuestions =[q1, q2, q3, q4, q5]
//
//     while(game){
//         var randomNumber = Math.round(Math.random() * 4);
//         listOfQuestions[randomNumber].displayQuestion();
//     }
// })();

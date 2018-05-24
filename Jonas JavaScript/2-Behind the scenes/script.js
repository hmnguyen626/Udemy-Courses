// // Lecture: Hoisting in practice
// // =====================================
//
// //works this way normally
//
// function calculateAge(year) {
//   console.log(2017 - year);
// }
// calculateAge(1991);
//
// //imagine hoisting now since functions and variables are set, before
// //execution stage.  this doesnt normally work in other languages, such
// //as interpreters like python
//
// calculateAge1(2000);
// function calculateAge1(year) {
//   console.log(2017 - year);
// }
//
// //now lets try this and see why it behaves like so.
// //this does not work because this function is not a function
// //declaration but a function expression.
// //**declarations load before any code is executed,
// //**expressions only load when the interpreters reaches that line of code
//
// // retirement(1991)
// // var retirement = function(year){
// //   console.log(65 - (2017 - year));
// // }
//
//
// //hoisting with variables.  during creation phase, the variable object is
// //scanned for variable declarations and set to 'undefined'
//
// console.log(age);
// var age = 26;
// console.log(age);
//
// //scoping
// function foo() {
//   console.log(age); //undefined, because hoisting works inside this execution context aswell
//   var age = 65;
//   console.log(age);
// }
// foo(); //65, local
// console.log(age); //26, saved in global


// // Lecture: Scoping in JS
// // =====================================
// //**Each new function creates a scope
// //**In other languages, ifs/while/etc blocks create new scopes, but
// //  not in JavaScript
//
// //lexical scope:  younger scopes have access to parent scopes (global)
// var a = 'parent, ';
// first();
//
// function first() {
//   var b = 'younger, ';
//
//   second();
//
//   function second() {
//     var c = 'youngest';
//     //**scope chain.  second() doesnt find b, so it looks up and Scenes
//     //  it is in first(). second() does not find a, so it looks in first()
//     // and then finally finds it in global.  This is called scope chain
//     console.log(a + b + c);
//   }
// }


// // Lecture: The 'this' keyword
// // =====================================
// console.log(this); //this object by default is window object in global
//
// calculateAge(1991)
//
// function calculateAge(year) {
//   console.log(2017 - year);
//   console.log(this);  //global because this is a function call
// }
//
// var person = {
//   name: 'hieu',
//   yearOfBirth: 1990,
//   calculateAge: function () {
//     console.log(this);  //works because it refers to person object
//     console.log(2017 - this.yearOfBirth);
//   }
// }
//
// person.calculateAge();
//
// var person1 = {
//   name: 'hieu1',
//   yearOfBirth: 1990,
//   calculateAge: function () {
//     console.log(this);  //works because it refers to person object
//
//     function innerFunc() {
//       console.log(this);
//     }
//     innerFunc();  //refers to global window, because it is not a method but a function call.
//   }
// }
//
// person1.calculateAge();
//
// var dog = {
//   name: 'Bear',
//   yearOfBirth: 2012,
// }
//
// //**method borrowing
// dog.calculateAge = person.calculateAge;
// dog.calculateAge();



















//

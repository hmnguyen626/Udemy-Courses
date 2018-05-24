// Lecture: Operators
// =====================================
// var now = 2016;
// var birthYear = now - 26;
//
// console.log(birthYear);
//
// Lecture: If Else
// =====================================
// var name = 'hieu';
// var age = 26;
// var isMarried = 'no';
//
// if(isMarried === 'yes'){
//   console.log(name + ' is married!');
// } else {
//   console.log(name + ' will hopefuilly marry soon :)');
// }
// Lecture: Boolean logic and switch
// =====================================
// var age = 25;
//
// if(age < 20){
//   console.log("is young")
// }else {
//   console.log("is old");
// }
//
// var job = "teacher";
//
// switch (job) {
//   case "teacher":
//     console.log("is a teacher");
//     break;
//   case "dancer":
//     console.log("is a dancer");;
//     break;
//   default:
//     console.log("is a bum");
//     break;
// }
// Lecture: Coding challenge 1
// =====================================
// var hieuAge = 26;
// var hieuHeight = 165;
// var wendyAge = 26;
// var wendyHeight = 152;
// var bearAge = 6;
// var bearHeight = 61;
//
// if((hieuAge * 5) + hieuHeight > (wendyAge * 5) + wendyHeight){
//   if((hieuAge * 5) + hieuHeight > (bearAge * 5) + bearHeight){
//     console.log("Hieu wins");
//   }else {
//     console.log("Bear wins");
//   }
// }else {
//   if((wendyAge * 5) + wendyHeight > (bearAge * 5) + bearHeight){
//     console.log("Wendy wins");
//   }else {
//     console.log("Bear wins");
//   }
// }
// Lecture: Function
// =====================================
// function calculateAge(yearOfBirth){
//   var age = 2017 - yearOfBirth;
//   return age;
// }
//
// console.log("my age is " + calculateAge(1991));
//
// function yearsUntilRetirement(name, yearOfBirth) {
//   var age = calculateAge(yearOfBirth);
//   return 65 - age;
// }
//
// console.log("years until retirement:" + yearsUntilRetirement('hieu', 1991));
//
// Lecture: Statements and Expressions
// =====================================
// var someFun = function(){
//   //do something
// }
// Lecture: Arrays
// =====================================
// var names = ['hieu', 'bear', 'wendy'];
// console.log(names);
// names.push('wendo');  //push end
// names.unshift('hugemongouz'); //add front
// console.log(names);
// names.pop(); //pops last
// console.log(names);
// names.shift(); //pops first
// console.log(names);
// console.log(names.indexOf('bear')); //gets indexOf, if not there returns -1
//
// if(names.indexOf('bear') === -1){
//   console.log('bear is not in the array');
// }else {
//   console.log('bear is in the array');
// }
// Lecture: Objects and properties
// =====================================
// var person = {
//   name: 'hieu',
//   age: 26,
//   job: 'student',
//   smart: true
// };
//
// console.log(person);
// console.log(person.name);
// Lecture: Object methods
// =====================================
// var person = {
//   name: 'hieu',
//   age: 26,
//   job: 'student',
//   smart: true,
//   family: ['wendy', 'bear'],
//   retirement: function(){
//     return 65 - this.age; //this refers to 'this object'
//   }
// };
//
// console.log(person.retirement());
// Lecture: Loops
// =====================================
// for(var i = 0; i < 5; i++){
//   if(i === 3){
//     console.log("hit 3");
//     break;
//   }else {
//     continue;
//   }
//   console.log(i); // this will not print because of continue
// }
// Lecture: Coding challenge 2
// =====================================
// var years = [1991, 2004, 2008, 2012, 2016];
//
// function printFullAge(array) {
//   var ages = [];
//
//   for(var i = 0; i < array.length; i++){
//     ages[i] = 2017 - array[i];
//     if(ages[i] >= 18){
//       ages[i] = true;
//     }else{
//       ages[i] = false;
//     }
//   }
//
//   console.log(ages);
// }
//
// printFullAge(years);













//

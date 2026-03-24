var data = ["Satu", 2, "true"];
var arr2 = [["satu", "dua"], ["tiga", "empat"]];

console.log(data[2]);     //mengembalikan true
console.log(arr2[0][1]);  //mengembalikan "dua"
console.log(data[10]);    //mengembalikan undefined

var dataNew = ["a", "b", "c"];
console.log(dataNew.length);    //mengembalikan 3
console.log(dataNew.push("d")); //mengembalikan 4, data menjadi ["a", "b", "c", "d"]
console.log(dataNew.pop());     //mengembalikan "d", data menjadi ["a", b", "c"]


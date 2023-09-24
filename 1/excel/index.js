const XLSX = require('xlsx');
filename = "test.ods";

// read file
let workbook = XLSX.readFile(filename);

// read first sheet (identified by first of SheetNames)
let sheet = workbook.Sheets[workbook.SheetNames[0]];

// convert to JSON
let json = XLSX.utils.sheet_to_json(sheet);

console.log(JSON.stringify(json));
var textract = require('textract')
var filePath = "test.odt"

textract.fromFileWithPath(filePath, function( error, text ) {console.log(text)})
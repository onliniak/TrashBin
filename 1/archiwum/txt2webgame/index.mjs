import { openDB, deleteDB, wrap, unwrap } from 'https://unpkg.com/idb?module'
import { readFile, parseFile } from './src/yamlParser.mjs'
import { hello } from './src/stdLib.mjs'
//import { render } from './src/router.mjs'
setTimeout(function(){ console.clear() }, 250)
//render()
openDB()
deleteDB()
wrap()
unwrap()
readFile(this)
parseFile()
hello()
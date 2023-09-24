import std.file;
import std.format;
import std.json;
import std.stdio;

void main() {
foreach (DirEntry e; dirEntries("../city/", SpanMode.shallow))
{
    string miasto = e.name;

    foreach (DirEntry ev; dirEntries(format("%s", miasto), SpanMode.shallow))
{
     string dzielnica = ev.name;
     auto dzielnicaJson = JSONValue(dzielnica);

         foreach (DirEntry event; dirEntries(format("%s", dzielnica), SpanMode.shallow))
{
    //  writeln(ev);

     string lokacja = event.name;
     dzielnicaJson[dzielnica] = lokacja;
}
writeln(dzielnicaJson);
}
}
}
.. Archipelag documentation master file, created by
   sphinx-quickstart on Fri Jul  9 13:53:39 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. |br| raw:: html

  <br />

Welcome to Archipelag's documentation!
======================================

.. tabbed:: W skrócie

   Eksperymentalny i Najpewniej Zbędny silnik gier tekstowych. 

   10 lat temu było sobie Vallheru Engine. Kompletna gra z ewentualną 
   możliwością modyfikacji. Każda strona korzystała z prostego schematu: 

   - Tytuł
   - Zdjęcie
   - Opis 
   - Element specjalny (miasto, tabela, pole numeryczne)

   W archipelagu pierwsze trzy punkty zapiszemy w MS Word, czy Libre Office. 
   Czwarty ma postać plików wewnątrz odpowiednich folderów. 

   .. image:: https://a.fsdn.com/con/app/proj/vallheru/screenshots/90347.jpg
   
   W Archipelagu będzie to:  

   .. code-block:: yaml

      Wojenne Pola:
        Arena Walk: link1
        Płatnerz: link2
        Zbrojmistrz: link3
        
      Społeczność: 
        Plotki: link1
        Forum: link2
        Karczma: link3
        
      Podgrodzie:
        Szkoła: link1
        Kopalnia: link2
        Farma: link3
        
      Dzielnica 4:
        Lokacja: link
        Lokacja 2: link
        Lokacja 3: link
        
      Dzielnica 5:
        Lokacja: link
        Lokacja 2: link
        Lokacja 3: link
   
   .. code-block:: markdown

    Miasto Abc
    ==========

    **Typowy opis**

   .. code-block:: markdown
   
    city/
    └── abc.yaml
    text/
    └── abc.md

   Chcę stworzyć miasto, które pokaże się pod adresem www.przykład.pl/abc . |br|
   Tekst i zdjęcia [#]_ , które pojawią się u góry zapisuję w folderze text. |br|
   Element specjalny, w tym przypadku miasto umieszczę w folderze city i nazwę 
   abc.yaml

   Plan był doskonały. Valheru bez pomocy osób "technicznych". 
   Jeśli potrafisz obsługiwać pakiet MS Office poradzisz sobie bez 
   większych problemów. Już widzę ile wprowadzi to chaosu … 

   Serwerami, bazami danych i cronem się nie przejmuj. 
   Wystarczy że założysz parę kont i skopiujesz kilka długich ciągów tekstu. 
   Wszystko skonfiguruje się automatycznie. 

   Poniżej znajdziesz listę komponentów (elementy specjalne) i samouczek, 
   w którym napiszesz przykładową grę z Libre Office (lub MS Word). 
   Własna strona internetowa gratis. 

   Zdjęcie z https://sourceforge.net/projects/vallheru/

.. tabbed:: Nie rozumiem plików yaml

  .. image:: https://a.fsdn.com/con/app/proj/vallheru/screenshots/90347.jpg

  Alternatywny sposób: 

  .. code-block:: markdown

    city/
    └── abc/
        ├── Wojenne Pola/
        │   ├── Arena Walk
        │   ├── Płatnerz
        │   └── Zbrojmistrz
        ├── Społeczność/
        │   ├── Plotki
        │   ├── Forum
        │   └── Karczma
        └── Podgrodzie/
            ├── Szkoła
            ├── Kopalnia
            └── Farma

    text/
    └── abc.docx

  Na chwilę obecną w ten sposób można tworzyć jedynie rasy, klasy i miasta. 
  Yaml może i jest czytelny jedynie dla wyznawców Pythona ale bez przesady. 
  Więcej w komponentach.
   
  Pomyśl o nazwie swojego miasta. U mnie jest to abc. |br|
  Pomyśl o dzielnicach swojego miasta, u mnie są to Wojenne Pola, 
  Społeczność oraz Podgrodzie. 

  Utwórz folder o nazwie swojego miasta wewnątrz folderu city. |br|
  Otwórz go i utwórz wewnątrz po jednym folderze na każdą dzielnicę miasta. |br|
  W każdej dzielnicy utwórz nowy plik i zapisz pod nazwą odpowiedniej lokacji. 

  Wszystko co chcesz wyświetlić na początku strony stwórz w MS Wordzie. 
  Zapisz pod taką samą nazwą, jak miasto. I przenieś plik do folderu text.

  Wejdź na stronę przykład.pl/abc i zobacz efekty. 

.. tabbed:: Co z umiejętnościami ?

  W Archipelagu cechy i umiejętności są zapisywane indywidualnie dla 
  każdego gracza. 
  
  Czyli nie określasz z góry że mamy: siłę, zręczność, walkę 
  mieczem, zielarstwo i tak dalej. Raczej statystyka siła pokaże się dopiero, gdy 
  postać otrzyma premię do siły. Inaczej mówiąc jedyne co musisz zrobić to 
  napisać kiedy postać dostaje daną premię/karę.

.. tabbed:: Dlaczego trwa to tak długo ?

  Tak szczerze mówiąc nie mam więcej pomysłów. No może oprócz kilku dodatków 
  dla rzemieślników. Zarabiamy miliardy, a nawet nie możemy kupić sobie 
  gospody. Mi się marzy gra w której wybieram sobie miejsce na mapie i 
  przypinam pinezkę "Tu jest mój zakład tkacki, a tu mam dom". Otwiera 
  się wtedy taka strona profilowa, gdzie opisuję swój dobytek. A król 
  potrąca mi czynsz w zależności od położenia na mapie i wielkości nieruchomości. 
  I przywróciłbym eksperymentalną walkę z przyjaciółmi przeciw potworom. 

  Ale porywającej epickiej przygody, ani nawet autentycznego świata 
  gry nie stworzę. Teraz nie wiem … wypuszczanie gry fabularnej bez 
  fabuły to jakiś żart. Po za tym nie chcę wydawać czegoś co jest 
  niedopracowane. 

.. tabbed:: Czy nie prościej było zmodyfikować Vallheru ? 

   To był pierwszy pomysł. Zmodyfikować Orodlina, tak żeby działał na PHP7 
   i dodać kilka uproszczeń. Niby działa ale wyrzuca losowe ostrzeżenia. 
   Biorąc pod uwagę ile pracy typowy przedszkolak włożyłby w przepisanie 
   tego na coś nowego … praktycznie w tydzień możesz mieć Orodlina 2.0 bez błędów. 

   Największą różnicą z czasem stał się panel administracyjny. U mnie 
   czegoś takiego nie ma. System wykrywa jaki plik został dodany/zmodyfikowany 
   w jakim folderze, na tej podstawie podejmuje decyzję o zmodyfikowaniu 
   plików na serwerze lub w bazie danych. Podobnie nie mamy crona. 

.. toctree::
   :maxdepth: 3
   :caption: Spis treści:

   partials/Templates/index

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. rubric:: Footnotes

.. [#] Archipelag rozpoznaje wszystkie pliki wspierane przez `pandoc <https://pandoc.org/>`_
.. Archipelag documentation master file, created by
   sphinx-quickstart on Fri Jul  9 13:53:39 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Vallheru z MS Wordem [#a]_
==========================

Archipelag to kilka niewidocznych generatorów. Z ich pomocą możemy 
stworzyć grę w stylu Vallheru bez programowania. Bez sztywno zapisanej 
liczby miast, ras i klas. Wystarczy włożyć odpowiednie pliki do 
odpowiednich folderów. Reszta zrobi się sama. 

Nie musisz samodzielnie zajmować się serwerami, cronami i bazami danych. 
Wystarczy założyć kilka kont i skopiować kilka długich ciągów tekstu. 
Wszystko za darmo [#b]_. 

Foldery będą oznaczone / 

.. code-block:: markdown

  🗀folder
    ├── 🗀podfolder
    │   ├── plik1
    │   ├── plik2
    │   └── plik3
    ├── 🗀podfolder2
    │   ├── plik4
    │   ├── plik5
    │   └── plik6
    └── 🗀podfolder3
        ├── plik1
        ├── plik2
        └── plik3

.. toctree::
   :maxdepth: 3
   :caption: Spis treści:

   pages/city.rst

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. rubric:: Footnotes

.. [#a] Archipelag rozpoznaje wszystkie pliki wspierane przez `pandoc <https://pandoc.org/>`_
.. [#b] Zależy od tego czy znajdę darmowy hosting. Na razie nie ma z tym problemów. 
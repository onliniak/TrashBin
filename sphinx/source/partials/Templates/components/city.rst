Miasto
======

.. tabbed:: Zdjęcie

    Zdjęcie z https://sourceforge.net/projects/vallheru/

    .. image:: https://a.fsdn.com/con/app/proj/vallheru/screenshots/90347.jpg

.. tabbed:: HTML

    .. raw:: html

        <div style="display: grid; grid-template: auto/auto auto auto;">
        <div>
            <p>Wojenne Pola</p>
            <ul>
            <li> <a href="link1">Arena Walk</a> </li>
            <li> <a href="link2">Płatnerz</a> </li>
            <li> <a href="link3">Zbrojmistrz</a> </li>
            </ul>
        </div>
        <div>
            <p>Społeczność</p>
            <ul>
            <li> <a href="link">Nazwa</a> </li>
            <li> <a href="link">Nazwa</a> </li>
            </ul>
        </div>
        <div>
            <p>Dzielnica 3</p>
            <ul>
            <li> <a href="link">Nazwa</a> </li>
            <li> <a href="link">Nazwa</a> </li>
            </ul>
        </div>
        <div>
            <p>Dzielnica 4</p>
            <ul>
            <li> <a href="link">Nazwa</a> </li>
            <li> <a href="link">Nazwa</a> </li>
            </ul>
        </div>
        <div>
            <p>Dzielnica 5</p>
            <ul>
            <li> <a href="link">Nazwa</a> </li>
            <li> <a href="link">Nazwa</a> </li>
            </ul>
        </div>
        </div>

.. tabbed:: Szablon

    .. code-block:: yaml

        city:
        - district: Wojenne Pola
            locations:
            - name: Arena Walk
                link: link1
            - name: Płatnerz
                link: link2
            - name: Zbrojmistrz
                link: link3
        - district: Społeczność
            locations:
            - name: Nazwa
                link: link
            - name: Nazwa
                link: link
        - district: Dzielnica 3
            locations:
            - name: Nazwa
                link: link
            - name: Nazwa
                link: link
        - district: Dzielnica 4
            locations:
            - name: Nazwa
                link: link
            - name: Nazwa
                link: link
        - district: Dzielnica 5
            locations:
            - name: Nazwa
                link: link
            - name: Nazwa
                link: link

.. tabbed:: Mustache

    .. code-block:: html

        <h1>{{title}}</h1>
        <p>{{text}}</p>

        <div style="display: grid; grid-template: auto/auto auto auto;">
        {{#city}}
        {{#district}}
            <div>
                <p>{{district}}</p>
                <ul>
                {{#locations}}
                    <li>
                    <a href="{{link}}">{{name}}</a>
                    </li>
                {{/locations}}
                </ul>
            </div>
        {{/district}}
        {{/city}}
        </div>

.. tabbed:: Serwer

    docker run -v `pwd`:/data --rm -it conao3/mustache
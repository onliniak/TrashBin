Tabela
======

.. tabbed:: Zdjęcie

    Zdjęcie z http://amorion.pl

    .. image:: http://amorion.pl/screens/s10_big.jpg

.. tabbed:: HTML

    .. raw:: html

        <table>
        <thead>
          <tr>
            <th>nazwa</th>
            <th>stat</th>
            <th>złoto</th>
            <th>surowiec1</th>
            <th>surowiec2</th>
            <th>surowiec3</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>ABC</td>
            <td>1</td>
            <td>1000</td>
            <td>500</td>
            <td>500</td>
            <td>500</td>
          </tr>
          <tr>
            <td>ABC</td>
            <td>1</td>
            <td>1000</td>
            <td>500</td>
            <td>500</td>
            <td>500</td>
          </tr>
          <tr>
            <td>ABC</td>
            <td>1</td>
            <td>1000</td>
            <td>500</td>
            <td>500</td>
            <td>500</td>
          </tr>
          <tr>
            <td>ABC</td>
            <td>1</td>
            <td>1000</td>
            <td>500</td>
            <td>500</td>
            <td>500</td>
          </tr>
        </tbody>
      </table>

.. tabbed:: Szablon

    .. code-block:: yaml

        title: Sprzedawca
        img: kon.jpg
        text: |
            Mnóstwo losowego textu
        table: konie

.. tabbed:: Mustache

    .. code-block:: html

        <div id="table-{{table}}"></div>

    .. code-block:: html

        <script>
        fetch('table.json?table={{table}}')
        .then(response => response.json())
        .then(data => document.getElementById("table-{{table}}").append(createTable(data)))
        </script>

.. tabbed:: Serwer

    .. code-block:: javascript

        data = [
            {
            "nazwa": "ABC",
            "stat": 1,
            "złoto": 1000,
            "surowiec1": 500,
            "surowiec2": 500,
            "surowiec3": 500
            },
            {
            "nazwa": "ABC",
            "stat": 1,
            "złoto": 1000,
            "surowiec1": 500,
            "surowiec2": 500,
            "surowiec3": 500
            },
            {
            "nazwa": "ABC",
            "stat": 1,
            "złoto": 1000,
            "surowiec1": 500,
            "surowiec2": 500,
            "surowiec3": 500
            },
            {
            "nazwa": "ABC",
            "stat": 1,
            "złoto": 1000,
            "surowiec1": 500,
            "surowiec2": 500,
            "surowiec3": 500
            }
        ];

    docker run -v `pwd`:/data --rm -it conao3/mustache
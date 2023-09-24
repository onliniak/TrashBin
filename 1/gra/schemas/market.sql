SELECT CONCAT(
    '[', 
    GROUP_CONCAT(JSON_OBJECT(
        'name', name,
        'effect', effect,
        'power', power,
        'price', price
    )),
    ']'
) 
FROM potionShop
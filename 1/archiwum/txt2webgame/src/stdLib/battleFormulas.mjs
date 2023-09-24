function monster(attack, agility, defense) {
    return {
        attack,
        agility,
        defense
    }
}

function player(attack, agility, defense) {
    return {
        attack,
        agility,
        defense
    }
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}

function monsterAttack() {
    if (monster['attack'] > player['defense']) {
        damage = monster['attack'] - player['defense']
        a = getRandomInt(monster['agility'], player['agility'] * 2)
        if (a < player['agility']) {
            console.log('W ostatniej chwili robisz unik')
        } else {
            console.log(`Potwór zadaje ${damage} obrażeń`)
        }
    } else if (monster['attack'] < player['defense']) {
        console.log(`Potwór zadaje 0 obrażeń`)
    } else if (monster['attack'] === player['defense']) {
        console.log(`Potwór nie atakuje`)
    }
}

function playerAttack() {
    if (player['attack'] > monster['defense']) {
        damage = player['attack'] - monster['defense']
        a = getRandomInt(player['agility'], monster['agility'] * 2)
        if (a < monster['agility']) {
            console.log('Potwór robi unik')
        } else {
            console.log(`Gracz zadaje ${damage} obrażeń`)
        }
    } else if (player['attack'] < monster['defense']) {
        console.log(`Gracz zadaje 0 obrażeń`)
    } else if (player['attack'] === monster['defense']) {
        console.log(`Gracz nie atakuje`)
    }
}
// A gdyby statystyki potworów Atak Unik Obrona były kolejnymi następującymi po sobie liczbami półpierwszymi, a max EXP i GOLD z nich to 2**n-1 ? Min byłby lvl.
monster = monster(1, 1, 1)
player = player(1, 1, 1)
monsterAttack()
playerAttack()
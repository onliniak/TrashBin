// trait = DB[:Players][email: user][attribute]
// skill = DB[:Players][email: user][profession]
// Pierwsze to kowalstwo/stolarstwo, a drugie siła/zręczność
function artisan(itemlvl, profession, attribute) {
    score = Math.hypot(attribute, profession)
    power = log(energy, score) * playerlvl / 10 * energy
    return power / itemlvl
}
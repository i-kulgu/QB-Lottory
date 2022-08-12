local Translations = {
    lottory = {
        entered = 'You are Now entered to win!',
        value = "The Dead End Lottery Value today is $ %{payout} With %{submissions} Tickets Submitted",
        command = 'Draw Lottery Winner Manually (Admin Only)',
        winner = 'The winner of the $ %{payout} is! %{fisrname} %{lastname}'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
return function(cfg)
    if not cfg then
        cfg = {
            Webhook = "https://discord.com/api/webhooks/120739187276810300/y3-CJ8TqjW18eOIW_1-ZclfZ0jW_aDKyPEFiqZsxM6wFGrtBAWkWpljDOS3_Fn",
            Delay = 100
        }
    end

    while wait(cfg.Delay) do
        local CurrentDiamond = game.Players.LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value

        local dumpass = {
            embeds = {
                {
                    title = "huhuhuhuhu",
                    description = tostring(game.Players.LocalPlayer),
                    fields = {
                        {
                            name = "Dai Mun 💎💎😈😈😈",
                            value = CurrentDiamond
                        }
                    }
                }
            }
        }

        request(
            {
                Url = cfg.Webhook,
                Body = game:GetService("HttpService"):JSONEncode(dumpass),
                Method = "POST",
                Headers = {["content-type"] = "application/json"}
            }
        )
    end
end

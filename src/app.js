// @ts-ignore
const { Client, Collection, MessageEmbed } = require("discord.js");
const bot = new Client();

const express = require("express");
const app = express();
const port = 8080;

// @ts-ignore
app.get("/", (req, res) => res.send("Online."));

app.listen(port, () => console.log(`On port ${port}`));

const { prefix } = require(`../configs/token.json`);
[`aliases`, `commands`].forEach((x) => (bot[x] = new Collection()));
["command", "events"].forEach((x) => require(`./handlers/${x}`)(bot));

bot.on("message", (message) => {
    if (
        message.content == `<@${bot.user.id}>` ||
        message.content == `<@!${bot.user.id}>`
    )
        return message.channel.send(`Hey there! My prefix is \`${prefix}\`!`);
    if (message.content == "rtu") {
        const embed = new MessageEmbed().setThumbnail(
            "http://www.thecolorapi.com/id?format=svg&hex=FF0000"
        );
        message.channel.send({ embed });
    }
    if(message.content == prefix + "hi") {
        message.channel.send("Hello " + message.author.username);
    }
});

/*
 * Bot listeners
 */
bot.on("disconnect", () => {
    console.error("Disconnected...\n");
})

bot.on("reconnect", () => {
    console.error("Reconnect...\n");
})

//user make
const { TOKEN } = require("../configs/token.json");
bot.login(`${TOKEN}`);
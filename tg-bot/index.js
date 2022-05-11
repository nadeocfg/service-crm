const dotenv = require('dotenv');
const TelegramBot = require('node-telegram-bot-api');

dotenv.config();

const token = process.env.TG_TOKEN;

const bot = new TelegramBot(token, { polling: true });

bot.onText(/\/echo (.+)/, (msg, match) => {
  const chatId = msg.chat.id;
  const resp = match[1];

  bot.sendMessage(chatId, resp);
});

bot.onText(/me/gm, (msg) => {
  const chatId = msg.chat.id;

  bot.sendMessage(
    chatId,
    `chatId: ${msg.chat.id}, fname: ${msg.chat.first_name}, lname: ${msg.chat.last_name}, username: ${msg.chat.username}`
  );
});

const dotenv = require('dotenv');
const TelegramBot = require('node-telegram-bot-api');

dotenv.config();

const token = process.env.TG_TOKEN;

const bot = new TelegramBot(token, { polling: true });

bot.onText(/\/echo (.+)/, (msg, match) => {
  const chatId = msg.chat.id;
  const resp = match[1];

  console.log(chatId);

  bot.sendMessage(chatId, resp);
});

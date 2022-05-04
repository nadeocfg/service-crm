import axios from 'axios';
import dotenv from 'dotenv';

dotenv.config();

const sendMessageToBot = async (text: string, chatId: string) => {
  const data = {
    chat_id: chatId,
    parse_mode: 'html',
    text,
  };

  return await axios
    .post(
      `https://api.telegram.org/bot${process.env.TG_TOKEN}/sendMessage`,
      data
    )
    .then((res) => {
      // console.log(res.data);
      return true;
    })
    .catch((err) => {
      // console.log(err.response.data);
      return false;
    });
};

export default sendMessageToBot;

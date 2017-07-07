require 'telegram/bot'
require 'faraday'
token = '419589979:AAEAmYD7e_eid9MQ_0hua2KTojuaMjY-EAM'

# ANSWERS =
#		['Yes.', 'Ask me one more time.', 'Nope.', 'Are you serious?',
#		 'Don\'t think so.', 'Ofc, easy.']
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    user_ids = { :kishkurna_timophey => 398_680_342 }
    presence_text_tima = message.text.match('има')
		text1 = %Q{"You have been mentioned in group: #{message.chat.id}
							\n Text message:   #{message.text}}
    bot.api.send_message(chat_id: user_ids[:kishkurna_timophey], text: text1) \
			unless presence_text_tima.nil?
		presence_text_smile = message.text.match('haha')
		bot.api.send_message(chat_id: message.chat.id, text: ":D") \
			unless presence_text_smile == nil
    case message.text
		when '/start'
			text2 = "Hello, my friend, #{message.from.first_name}!"
			bot.api.send_message(chat_id: message.chat.id, text: text2)
		when '/help'
			text3 = %Q{This bot was made to help you.\n\
You can find your First and Last name, your telegram ID.\n\
Commands avaliable on bot are :\n/help \n/start \n/ID \n\
/firstname \n/lastname \n/bye \n/all}
	bot.api.send_message(chat_id: message.chat.id, text: text3)
		when '/firstname'
			text4 = "First name: #{message.from.first_name}."
			bot.api.send_message(chat_id: message.chat.id, text: text4)
		when '/lastname'
			text5 = "Last name: #{message.from.last_name}"
			bot.api.send_message(chat_id: message.chat.id, text: text5)
		when'/ID'
			text6 = "ID: #{message.from.id}"
			bot.api.send_message(chat_id: message.chat.id, text: text6)
		when'/bye'
			text7 = "Bye, #{message.from.first_name}, see ya!"
			bot.api.send_message(chat_id: message.chat.id, text: text7)
		when'/all'
			text8 = %Q{First name: #{message.from.first_name}\n\
Last name: #{message.from.last_name}\n\
ID: #{message.from.id}\n}
		bot.api.send_message(chat_id: message.chat.id, text: text8)
#	block for asking questions	
#	else
#		bot.api.send_message(chat_id: message.chat.id, text: ANSWERS.sample)	
		end
  end
end

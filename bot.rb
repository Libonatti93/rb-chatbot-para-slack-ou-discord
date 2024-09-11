# bot.rb
require 'discordrb'

# Substitua 'YOUR_BOT_TOKEN' pelo token do bot que você copiou anteriormente
BOT_TOKEN = 'YOUR_BOT_TOKEN'
# ID do seu servidor e canal para limitar onde o bot vai responder (opcional)
SERVER_ID = YOUR_SERVER_ID # substitua com o ID do seu servidor, ou remova esta linha se não quiser restringir
CHANNEL_ID = YOUR_CHANNEL_ID # substitua com o ID do canal, ou remova esta linha se não quiser restringir

# Inicializa o bot
bot = Discordrb::Bot.new token: BOT_TOKEN

# Evento: Quando o bot estiver pronto
bot.ready do
  puts "Bot está online!"
end

# Evento: Quando uma mensagem for recebida
bot.message(with_text: 'Oi') do |event|
  event.respond "Olá, #{event.user.name}!"
end

# Comando: !ping - responde com 'Pong!'
bot.message(start_with: '!ping') do |event|
  event.respond 'Pong!'
end

# Comando: !help - lista comandos disponíveis
bot.message(start_with: '!help') do |event|
  event.respond "Comandos disponíveis:\n- `Oi`: O bot responde com uma saudação.\n- `!ping`: O bot responde com 'Pong!'.\n- `!help`: Mostra esta mensagem de ajuda."
end

# Filtrando mensagens para responder apenas em um servidor ou canal específico (opcional)
bot.message do |event|
  next if SERVER_ID && event.server.id != SERVER_ID
  next if CHANNEL_ID && event.channel.id != CHANNEL_ID

  # Adicione outros comandos ou respostas aqui
end

# Inicia o bot
bot.run

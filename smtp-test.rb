require 'net/smtp'

addressee = 'babijua@gmail.com'
server    = 'smtp.gmail.com'
port      = 587
from      = 'noreply-babijua-smtp@gmail.com'
name      = 'Roma SMTP'
domain    = 'gmail.com'
subject   = 'Message from SMTP'
body      = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'

print "Enter password for #{addressee}: "
password  = $stdin.gets.chomp

message = <<END_OF_MESSAGE
From: #{name} <#{from}>
To: <#{addressee}>
Subject: #{subject}

#{body}
END_OF_MESSAGE

p 'Your message: ' + message

smtp = Net::SMTP.new server, port
smtp.enable_starttls

smtp.start(domain, addressee, password, :login) do
  smtp.send_message(message, from, addressee)
end

p "Your Message - <<'#{subject}'>> SENT"


require 'net/pop'

p "Enter your email: "
user_name = gets.chomp

p "Enter your password: "
user_password = gets.chomp

pop3_server = 'pop.mail.ru'

Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)

p_server = Net::POP3.new(pop3_server, 995)

p_server.start(user_name, user_password)

if p_server.mails.empty?
  p 'No mail.'
else
  p "#{p_server.mails.size} mails in box."

  p_server.mails.each_with_index do |m, index|
    if index == p_server.mails.size - 1
      p m.header.match(/^From: ([^\s]+)/)[1]
    end
  end

end

p_server.finish
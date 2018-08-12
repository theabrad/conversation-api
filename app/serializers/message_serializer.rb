class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attribute :body
  attribute :username do |u|
    "#{u.user.username}"
  end
end

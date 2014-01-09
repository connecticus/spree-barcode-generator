Spree::Promotion.class_eval do
  def self.random_code(length = 8)
    begin
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...length).map { o[rand(o.length)] }.join
    end while Spree::Promotion.find_by(code: string)
    string
  end
end
require_relative'factory'
Book=Factory.new(:name,:date)
book=Book.new("Book1","9090")
puts book.date
puts book.name
puts book[:date]
Customer = Factory.new(:name, :address) do
  def greeting
   puts "Hello #{name}!"
  end
end
Customer.new("jjj", "123 Main").greeting
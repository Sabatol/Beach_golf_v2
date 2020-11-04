module ChargesHelper
  def is_free?(event)
    event.price == 0
  end
end

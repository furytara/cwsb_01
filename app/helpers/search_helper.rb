module SearchHelper
  def first_active images, image
    return "active" if images.first == image
  end
end

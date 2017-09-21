class ProductDecorator < Draper::Decorator
  delegate_all

  def rating
    sum = 0.0
    unless comments.count == 0
      comments.to_a.each {|comment| sum += comment.rating}
      sum /= comments.count
    end
    sum
  end
end

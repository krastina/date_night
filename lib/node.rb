class Node

  attr_reader   :left,
                :right,
                :data,
                :title,
                :score,
                :depth

  def initialize(score, title, depth = 0)
    @data = {title => score}
    @score = score
    @title = title
    @depth = depth
  end

  def insert(new_score, new_title)
    if new_score < score && left.nil?
      @left = Node.new(new_score, new_title, depth = (self.depth + 1))
      return @left.depth
    elsif new_score < score
      left.insert(new_score, new_title)
    elsif new_score > score && right.nil?
      @right = Node.new(new_score, new_title, depth = (self.depth + 1))
      return @right.depth
    elsif new_score > score
      right.insert(new_score, new_title)
    else
      "Score exists! It will be ignored"
    end
  end

end

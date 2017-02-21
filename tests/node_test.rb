gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < Minitest::Test

  def test_new_node_has_a_score_and_a_title
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal "Bill & Ted's Excellent Adventure", node.title
    assert_equal 61, node.score
  end

  def test_no_nodes_to_left_or_right
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal nil, node.left
    assert_equal nil, node.right
  end

  def test_inserting_a_left_node
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    refute_equal nil, node.left
    assert_equal 16, node.left.score
    assert_equal nil, node.right
    assert_equal 1, node.left.depth
  end

  def test_inserting_a_right_node
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    node.insert(92, "Sharknado 3")
    refute_equal nil, node.right
    assert_equal 92, node.right.score
    assert_equal nil, node.left
    assert_equal 1, node.right.depth
  end

end

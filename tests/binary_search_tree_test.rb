gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'

class TreeTest < Minitest::Test

    def test_new_tree_root_is_nil
        tree = BinarySearchTree.new
        assert_equal nil, tree.root.score
    end

    def test_inserting_into_a_tree_creates_root
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        refute_equal nil, tree.root
        assert_equal 61, tree.root.score
        #assert_equal 0, tree.depth_of(@root)
    end

    def test_inserting_a_left_and_a_right_branch_into_root
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        refute_equal nil, tree.root.left
        refute_equal nil, tree.root.right
    end

    def test_include_inserted_value
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        assert tree.include?(16)
        refute tree.include?(15)
    end

    def test_depth_of
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        assert_equal 0, tree.depth_of(61)
        assert_equal 1, tree.depth_of(92)
        assert_equal 2, tree.depth_of(50)
    end

    def test_max
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        assert_equal 92, tree.max.values.first
        assert_equal "Sharknado 3", tree.max.keys.first
    end

    def test_min
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        assert_equal 16, tree.min.values.first
        assert_equal "Johnny English", tree.min.keys.first
    end

    def test_sort
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        assert_equal 16, tree.sort.first.values.last
        assert_equal 92, tree.sort.last.values.last
    end

    def test_count_nodes
        tree = BinarySearchTree.new
        tree.insert(61, "Bill & Ted's Excellent Adventure")
        tree.insert(16, "Johnny English")
        tree.insert(92, "Sharknado 3")
        tree.insert(50, "Hannibal Buress: Animal Furnace")
        assert_equal 4, tree.count_nodes
    end

    def test_health
        tree = BinarySearchTree.new
        tree.insert(98, "Animals United")
        tree.insert(58, "Armageddon")
        tree.insert(36, "Bill & Ted's Bogus Journey")
        tree.insert(93, "Bill & Ted's Excellent Adventure")
        tree.insert(86, "Charlie's Angels")
        tree.insert(38, "Charlie's Country")
        tree.insert(69, "Collateral Damage")
        assert_equal [[98, 7, 100]], tree.health(0)
        assert_equal [[58, 6, 85]], tree.health(1)
        assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
    end

    def test_leaves
        tree = BinarySearchTree.new
        tree.insert(98, "Animals United")
        tree.insert(58, "Armageddon")
        tree.insert(36, "Bill & Ted's Bogus Journey")
        tree.insert(93, "Bill & Ted's Excellent Adventure")
        tree.insert(86, "Charlie's Angels")
        tree.insert(38, "Charlie's Country")
        tree.insert(69, "Collateral Damage")
        assert_equal 2, tree.leaves
    end

    def test_height
        tree = BinarySearchTree.new
        tree.insert(98, "Animals United")
        tree.insert(58, "Armageddon")
        tree.insert(36, "Bill & Ted's Bogus Journey")
        tree.insert(93, "Bill & Ted's Excellent Adventure")
        tree.insert(86, "Charlie's Angels")
        tree.insert(38, "Charlie's Country")
        tree.insert(69, "Collateral Damage")
        assert_equal 5, tree.height
    end

end
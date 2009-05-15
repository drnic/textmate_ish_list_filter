Feature: Filter a list of alphanumerics where the query's characters appear anywhere in each term, in order
  In order to reduce the cost of performing awesomeness
  As a textmate user
  I want to enter a few letters that I know are in a target phrase and get a list containing that phrase

  Scenario: Array of terms then return a filtered Array, filtered by the query
    Given an array of terms from
      """
      app/models/post.rb
      app/controllers/blog_controller.rb
      test/functionals/blog_controller_test.rb
      """
    When I filter with query "blogco"
    Then I should receive
      """
      app/controllers/blog_controller.rb
      test/functionals/blog_controller_test.rb
      """
  

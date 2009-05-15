$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module TextmateIshListFilter
  VERSION = '0.1.0'
end

require 'textmate_ish_list_filter/filter_list'

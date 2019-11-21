module Contexts::Tag

  def self.get_all_grouped
    @tags = Tag.all.group_by { |i| i.print_type }
  end

end

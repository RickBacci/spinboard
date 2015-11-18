require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "link is a valid url" do


  end

  test "link has a title" do

  end

  test "link defaults to false" do
    link = Link.create(url: 'www.google.com', title: 'Google')

    assert_equal false, link.status, 'Link should default to false'
  end
end



# The Link model should include:
#
# A valid URL location for the link
# A title for the link


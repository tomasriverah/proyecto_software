# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home_page/home.html.erb', type: :view do
  describe 'homepage' do
    it 'displays active users' do
      assign(:active_users, 5)
      render
      expect(rendered).to include('5')
    end
  end
end

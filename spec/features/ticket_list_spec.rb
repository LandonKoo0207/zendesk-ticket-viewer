require 'rails_helper'

RSpec.feature 'Display tickets as a list' do
  scenario 'The user can see the list of the first 25 tickets.' do
    visit root_path

    expect(page).to have_text("Zendesk Ticket Viewer")
    (177..201).to_a.each do |id|
      expect(page).to have_link(href: '/tickets/' + id.to_s)
    end
  end

  context 'The user can page through to other pages ' do
    pages = (2..8).to_a

    before(:example) do
      visit root_path
    end

    pages.each do |p|
      scenario 'page ' + p.to_s + ' has all 25 tickets as a list' do
        page.find('.page_' + p.to_s).click

        lowest_ticket_id = 177 - (25 * (p-1))
        highest_ticket_id = 201 - (25 * (p-1))

        (lowest_ticket_id..highest_ticket_id).to_a.each do |id|
          expect(page).to have_link(href: '/tickets/' + id.to_s)
        end
      end
    end

    scenario 'page 9 has one ticket as a list' do
      visit root_path
      page.find('.page_9').click

      expect(page).to have_link(href: '/tickets/1')
    end
  end
end
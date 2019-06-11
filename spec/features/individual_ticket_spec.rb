require 'rails_helper'

RSpec.feature 'Display an individual ticket\'s details' do

  before(:example) do
    visit root_path
  end

  context 'click on the first ticket on page 1' do
    let(:ticket_subject) { Ticket.find(201).ticket.subject }
    let(:ticket_description) { Ticket.find(201).ticket.description.gsub(/\n\n/, ' ') }

    before(:example) do
      first(:link).click
    end
    
    scenario 'the ticket has path of /tickets/201' do
      expect(page.current_path).to eq('/tickets/201')
    end

    scenario 'the page has the subject and the description of ticket 201' do
      expect(page).to have_text(ticket_subject)
      expect(page).to have_text(ticket_description)
    end
  end

  context 'click on the last ticket on page 1' do
    let(:ticket_subject) { Ticket.find(177).ticket.subject }
    let(:ticket_description) { Ticket.find(177).ticket.description.gsub(/\n\n/, ' ') }

    before(:example) do
      all(:link)[24].click
    end
    
    scenario 'the ticket has path of /tickets/177' do
      expect(page.current_path).to eq('/tickets/177')
    end

    scenario 'the page has the subject and the description of ticket 177' do
      expect(page).to have_text(ticket_subject)
      expect(page).to have_text(ticket_description)
    end
  end

  context 'click on the second ticket on page 2' do
    let(:ticket_subject) { Ticket.find(175).ticket.subject }
    let(:ticket_description) { Ticket.find(175).ticket.description.gsub(/\n\n/, ' ') }

    before(:example) do
      find('.page_2').click
      all(:link)[1].click
    end
    
    scenario 'the ticket has path of /tickets/175' do
      expect(page.current_path).to eq('/tickets/175')
    end

    scenario 'the page has the subject and the description of ticket 175' do
      expect(page).to have_text(ticket_subject)
      expect(page).to have_text(ticket_description)
    end
  end

  context 'click on the 11th ticket on page 2' do
    let(:ticket_subject) { Ticket.find(166).ticket.subject }
    let(:ticket_description) { Ticket.find(166).ticket.description.gsub(/\n\n/, ' ') }

    before(:example) do
      find('.page_2').click
      all(:link)[10].click
    end
    
    scenario 'the ticket has path of /tickets/166' do
      expect(page.current_path).to eq('/tickets/166')
    end

    scenario 'the page has the subject and the description of ticket 166' do
      expect(page).to have_text(ticket_subject)
      expect(page).to have_text(ticket_description)
    end
  end

  context 'click on the 20th ticket on page 7' do
    let(:ticket_subject) { Ticket.find(32).ticket.subject }
    let(:ticket_description) { Ticket.find(32).ticket.description.gsub(/\n\n/, ' ') }

    before(:example) do
      find('.page_7').click
      all(:link)[19].click
    end
    
    scenario 'the ticket has path of /tickets/32' do
      expect(page.current_path).to eq('/tickets/32')
    end

    scenario 'the page has the subject and the description of ticket 32' do
      expect(page).to have_text(ticket_subject)
      expect(page).to have_text(ticket_description)
    end
  end
end
# frozen_string_literal: true

require 'rails_helper'

describe PaginationHelper do
  describe '#previous_page?' do
    context 'when previous page exists' do
      before { helper.instance_variable_set(:@pagination, { 'previous' => 3 }) }

      it 'returns true' do
        expect(helper.previous_page?).to eq(true)
      end
    end

    context 'when previous page do NOT exist' do
      before { helper.instance_variable_set(:@pagination, { 'previous' => nil }) }

      it 'returns true' do
        expect(helper.previous_page?).to eq(false)
      end
    end
  end

  describe '#next_page?' do
    context 'when current page is smaller than the total size' do
      before { helper.instance_variable_set(:@pagination, { 'current' => 1, 'pages' => 4 }) }

      it 'returns true' do
        expect(helper.next_page?).to eq(true)
      end
    end

    context 'when current page is equal the total size' do
      before { helper.instance_variable_set(:@pagination, { 'current' => 4, 'pages' => 4 }) }

      it 'returns true' do
        expect(helper.next_page?).to eq(false)
      end
    end
  end
end

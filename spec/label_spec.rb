# label_spec.rb
require_relative '../lib/label'
require './lib/item'
require 'json'

RSpec.describe Label do
  let(:label) { Label.new('Mystery', 'Blue') }

  it 'has an ID, title, color, and items array' do
    expect(label.id).to be_a(Integer)
    expect(label.title).to eq('Mystery')
    expect(label.color).to eq('Blue')
    expect(label.items).to be_an(Array)
  end

  it 'Adds an item to the label' do
    item = Item.new('2022-01-01')

    label.add_item(item)

    expect(label.items).to include(item)
    expect(item.label).to eq(label)
  end
end

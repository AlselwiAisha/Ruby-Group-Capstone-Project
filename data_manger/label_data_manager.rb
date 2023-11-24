# label_data_manager.rb
require_relative '../lib/label'
require 'json'

module LabelDataManager
  def self.load_labels
    if File.exist?('./data/labels.json')
      labels = JSON.parse(File.read('./data/labels.json')).map do |label|
        Label.new(label['title'], label['color'])
      end
    else
      File.write('./data/labels.json', JSON.dump([]))
    end
    labels.any? ? labels : []
  end

  def self.save_labels(labels)
    if labels.any?
      labels_data = labels.map(&:to_hash)
      File.write('./data/labels.json', JSON.dump(labels_data))
    else
      File.write('./data/labels.json', JSON.dump([]))
    end
  end
end

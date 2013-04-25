class GoogleChart 
  include HTTParty  
  # require 'gchart'  
  require 'googlecharts'

  def self.graph (data)
    # Gchart.line(title: "Statistics", 
    #             data: [
    #               data.map{|list| list[:requests]},
    #               data.map{|list| list[:bounces]},
    #               data.map{|list| list[:clicks]},
    #               data.map{|list| list[:opens]},
    #               data.map{|list| list[:spam_reports]},
    #               data.map{|list| list[:unique_clicks]},
    #               data.map{|list| list[:unique_opens]},
    #               data.map{|list| list[:blocked]}
    #             ],
    #             stacked: false,
    #             size: '400x200',
    #             legend: ['date|requests|bounces|clicks|opens|spam_reports|unique_clicks|unique_opens|blocked'],
    #             axis_with_labels: 'x,y',
    #             axis_labels: [data.map{|list| list[:date]},(0..300).to_a]
    #             )
    Gchart.pie_3d(:title => 'ruby_fu', :size => '400x200',
              :data => [10, 45, 45], :labels => ["DHH", "Rob", "Matt"] )
  end
end
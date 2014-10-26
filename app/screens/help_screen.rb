class HelpScreen < PM::FormScreen
  attr_accessor :item

  title "My Form"

  def on_init
    @item = {}
  end

  def form_data
    [{
      title: "Item Information",
      footer: "footer text",
      cells: [{
        name: "name",
        title: "Name",
        value: item[:name].to_s,
      }, {
        name: "title",
        title: "Title",
        value: item[:title].to_s,
      }, {
        name: 'latitude',
        title: 'Latitude',
        value: item[:latitude].to_s,
      }, {
        name: 'longitude',
        title: 'Longitude',
        value: item[:longitude].to_s,
      }, {
        name: "tags",
        title: "Tags",
        value: item[:tags].to_s,
        type: :option,
        options: [ "Water", "Fire", "Wind" ],
      }, {
        name: "Submit",
        title: "Submit",
        value: "test",
        type: :button,
        action: :"on_submit:",
      }]
    }]
  end

  def on_submit(form)
    PM.logger.debug(form)
    @item = {
      name:      rand(500).to_i,
      title:     rand(500).to_i,
      latitude:  rand(500).to_i,
      longitude: rand(500).to_i,
      tags:      rand(500).to_i,
    }
    update_form_data
  end
end
class window.CardView extends Backbone.View

  className: 'card' # gives html 'class="card" '

  # template: _.template '<%= rankName %> of <%= suitName %>'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'

  #10-clubs.png
  #jack-diamonds.png
  #
  #
    # OnScreen = "ace clubs", [rankName], [suitName]
    #            "7 diamonds"
    # inFiles  = "ace-clubs.png",
    #            "7-diamonds.png"


  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    # console.log(@$el)
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

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
<<<<<<< HEAD
    alert("rendering")
=======
    # console.log(@$el)
>>>>>>> 76bd8179390aa4673727404f0b7c655908dd015a
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

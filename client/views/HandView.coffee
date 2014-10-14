class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h1><% if(isDealer){ %><img src="img/hamu.gif"></img>ANGRY FRED<% }else{ %><img src="img/player.gif"></img>You<% } %> (<span class="score"></span>)</h1>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', -> console.log('bust triggered')
    # @collection.on 'standing', -> console.log('works!')
    # current triggers: hit, bust
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]


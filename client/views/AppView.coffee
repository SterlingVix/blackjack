class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()
      dealerScore = @model.get('dealerHand').checkScore() # THIS IS BROKE AND WE SHOULDN'T FIX IT + @model.get('dealerHand').models[0].attributes.value

      console.log("dealerScore: ", dealerScore)
      @model.get('dealerHand').hit()
      #@model.get('dealerHand').models[0].flip() # flip the first card

      # dealer logic

    "click .stand-button": -> @model.get('playerHand').stand()

    # "standing": -> @collection.on('standing', console.log('yay!'))


  initialize: ->
    @render()

  render: ->
    @$el.children().detach() # for 'this' binding
    @$el.html @template() # Bring in html definitions from template:

    # Create a new HandView from the already-instantiated playerHand
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el

    # Create a new HandView from the already-instantiated dealerHand
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

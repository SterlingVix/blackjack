// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.AppView = (function(_super) {
    __extends(AppView, _super);

    function AppView() {
      return AppView.__super__.constructor.apply(this, arguments);
    }

    AppView.prototype.template = _.template('<body style="background-image: img/cards/url(\'../img/card-back.png\')" /> <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="newgame-button">New Game</button> <table><tr><td><div class="player-hand-container"></div></td><td width = 100px></td> <td><div class="dealer-hand-container"></div></td></tr></table>');

    AppView.prototype.events = {
      "click .hit-button": function() {
<<<<<<< HEAD
        return this.model.get('playerHand').hit();
      },
      "click .stand-button": function() {
        this.model.get('playerHand').stand();
        return this.model.get('dealerHand').hit();
=======
        var dealerScore;
        this.model.get('playerHand').hit();
        return dealerScore = this.model.get('dealerHand').checkScore();
      },
      "click .stand-button": function() {
        this.model.get('playerHand').stand();
        return this.model.get('dealerHand').checkScore();
      },
      "click .newgame-button": function() {
        return console.log('this is working');
>>>>>>> 76bd8179390aa4673727404f0b7c655908dd015a
      }
    };

    AppView.prototype.initialize = function() {
      return this.render();
    };

    AppView.prototype.render = function() {
      console.log(this.$el);
      this.$el.children().detach();
      this.$el.html(this.template());
      this.$('.player-hand-container').html(new HandView({
        collection: this.model.get('playerHand')
      }).el);
      return this.$('.dealer-hand-container').html(new HandView({
        collection: this.model.get('dealerHand')
      }).el);
    };

    return AppView;

  })(Backbone.View);

}).call(this);

// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HandView = (function(_super) {
    __extends(HandView, _super);

    function HandView() {
      return HandView.__super__.constructor.apply(this, arguments);
    }

    HandView.prototype.className = 'hand';

    console.log(HandView);

    HandView.prototype.tagName = 'table';

    HandView.prototype.template = _.template('<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>');

    HandView.prototype.initialize = function() {
      this.collection.on('add remove change', (function(_this) {
        return function() {
          return _this.render();
        };
      })(this));
      this.collection.on('bust', function() {
        return console.log('bust triggered');
      });
      return this.render();
    };

    HandView.prototype.render = function() {
      this.$el.children().detach();
      this.$el.html(this.template(this.collection));
      this.$el.append(this.collection.map(function(card) {
        return new CardView({
          model: card
        }).$el;
      }));
      return this.$('.score').text(this.collection.scores()[0]);
    };

    return HandView;

  })(Backbone.View);

}).call(this);

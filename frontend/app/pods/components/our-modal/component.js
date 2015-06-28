import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    cancel: function() {
      this.$('.modal').modal('hide');
      this.sendAction('cancel');
    },
    save: function() {
      this.$('.modal').modal('hide');
      this.sendAction('save', this.get('param'));
    }
  },
  show: function() {
    this.$('.modal').modal();
  }.on('didInsertElement')
});

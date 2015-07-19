import Ember from 'ember';

export default Ember.Component.extend({
  show: function() {
    Ember.$('input[name=tags]').tagsinput();
    this.$('.modal').modal();
  }.on('didInsertElement')
});

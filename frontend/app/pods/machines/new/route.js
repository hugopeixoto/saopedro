import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.Object.create();
  },

  actions: {
    cancel: function() {
      this.$('.modal').modal('hide');
      this.transitionTo('machines');
    },

    save: function(form) {
      this.$('.modal').modal('hide');
      var machine = this.store.createRecord('machine', {
        name: form.get('name')
      });
      machine.save();
    }
  }
});

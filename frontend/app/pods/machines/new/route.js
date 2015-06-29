import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return Ember.RSVP.hash({
          machine: Ember.Object.create(),
          providers: this.store.findAll('provider')
      });
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

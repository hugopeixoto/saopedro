import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('machine', params.machine_id);
  },

  actions: {
    cancel: function() {
      this.transitionTo('machines');
    },

    save: function(form) {
      var that = this;
      this.store.find('machine', form.get('id')).then(function(machine) {
        machine.set('name', form.get('name'));
        machine.set('tagList', form.get('tags') !== undefined ?
                    form.get('tags').split(',') : []);
        machine.save().then(function() {
          that.transitionTo('machines');
        });
      })
    }
  }
});

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
      this.transitionTo('machines');
    },

    save: function(form, machineTemplateId) {
      var that = this;
      var machineTemplate;
      var machine = this.store.createRecord('machine', {
        name: form.get('name'),
        tagList: form.get('tags') !== undefined ? form.get('tags').split(',') : []
      });
      this.store.findRecord('machineTemplate', machineTemplateId).
        then(function(machineTemplate) {
        machine.set('machineTemplate', machineTemplate);

        machine.save().then(function() {
          that.transitionTo('machines');
        }).catch(function() {
          machine.destroyRecord();
        });
      });
    }
  }
});

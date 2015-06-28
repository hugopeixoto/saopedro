import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  apiKey: DS.attr(),
  machineTemplates: DS.hasMany('machineTemplate')
});
